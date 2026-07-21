import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:open_filex/open_filex.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class UpdateStatus {
  final String currentVersion;
  final String? latestVersion;
  final bool updateAvailable;
  final bool isChecking;
  final bool isDownloading;
  final String? downloadedApkPath;
  final DateTime? lastChecked;
  final String? lastError;

  const UpdateStatus({
    this.currentVersion = '',
    this.latestVersion,
    this.updateAvailable = false,
    this.isChecking = false,
    this.isDownloading = false,
    this.downloadedApkPath,
    this.lastChecked,
    this.lastError,
  });

  bool get canInstall => downloadedApkPath != null;

  UpdateStatus copyWith({
    String? currentVersion,
    String? latestVersion,
    bool? updateAvailable,
    bool? isChecking,
    bool? isDownloading,
    String? downloadedApkPath,
    DateTime? lastChecked,
    String? lastError,
    bool clearDownloadedApkPath = false,
  }) {
    return UpdateStatus(
      currentVersion: currentVersion ?? this.currentVersion,
      latestVersion: latestVersion ?? this.latestVersion,
      updateAvailable: updateAvailable ?? this.updateAvailable,
      isChecking: isChecking ?? this.isChecking,
      isDownloading: isDownloading ?? this.isDownloading,
      downloadedApkPath: clearDownloadedApkPath ? null : (downloadedApkPath ?? this.downloadedApkPath),
      lastChecked: lastChecked ?? this.lastChecked,
      lastError: lastError,
    );
  }
}

class UpdateService extends ChangeNotifier {
  UpdateService._internal();

  static final UpdateService _instance = UpdateService._internal();

  factory UpdateService() => _instance;

  final String owner = 'MarcusNebel';
  final String repo = 'fogstorage';

  UpdateStatus _status = const UpdateStatus();

  UpdateStatus get status => _status;

  Future<void> checkForUpdates({bool autoInstall = false}) async {
    if (_status.isChecking) {
      return;
    }

    _setStatus(_status.copyWith(isChecking: true, lastError: null));

    try {
      final packageInfo = await PackageInfo.fromPlatform();
      final currentVersion = packageInfo.version;

      final response = await http.get(
        Uri.parse('https://api.github.com/repos/$owner/$repo/releases/latest'),
      );

      if (response.statusCode != 200) {
        _setStatus(
          _status.copyWith(
            currentVersion: currentVersion,
            isChecking: false,
            lastChecked: DateTime.now(),
            lastError: 'GitHub release request failed with ${response.statusCode}',
          ),
        );
        return;
      }

      final data = json.decode(response.body) as Map<String, dynamic>;
      final latestVersion = data['tag_name'].toString().replaceAll('v', '');
      final updateAvailable = _isNewerVersion(currentVersion, latestVersion);

      String? downloadedApkPath = _status.downloadedApkPath;

      if (updateAvailable) {
        final assets = (data['assets'] as List<dynamic>? ?? const <dynamic>[]);
        final apkAsset = assets.cast<dynamic?>().firstWhere(
              (asset) => asset != null && asset['name'].toString().endsWith('.apk'),
              orElse: () => null,
            );

        if (apkAsset != null) {
          downloadedApkPath = await _downloadApk(
            apkAsset['browser_download_url'].toString(),
            apkAsset['name'].toString(),
          );
        }
      } else {
        downloadedApkPath = null;
      }

      _setStatus(
        _status.copyWith(
          currentVersion: currentVersion,
          latestVersion: latestVersion,
          updateAvailable: updateAvailable,
          isChecking: false,
          downloadedApkPath: downloadedApkPath,
          lastChecked: DateTime.now(),
        ),
      );

      if (autoInstall && updateAvailable && downloadedApkPath != null) {
        await installDownloadedUpdate();
      }
    } catch (e) {
      _setStatus(
        _status.copyWith(
          isChecking: false,
          lastChecked: DateTime.now(),
          lastError: e.toString(),
        ),
      );
    }
  }

  Future<bool> installDownloadedUpdate() async {
    final filePath = _status.downloadedApkPath;
    if (filePath == null) {
      return false;
    }

    final file = File(filePath);
    if (!await file.exists()) {
      _setStatus(_status.copyWith(clearDownloadedApkPath: true, lastError: 'Downloaded APK not found.'));
      return false;
    }

    if (!await Permission.requestInstallPackages.request().isGranted) {
      _setStatus(_status.copyWith(lastError: 'Install permission denied.'));
      return false;
    }

    await OpenFilex.open(filePath);
    return true;
  }

  Future<String> _downloadApk(String url, String fileName) async {
    _setStatus(_status.copyWith(isDownloading: true, lastError: null));

    try {
      final directory = await _getUpdateDirectory();
      final filePath = '${directory.path}/$fileName';
      final file = File(filePath);

      if (!await file.exists()) {
        final response = await http.get(Uri.parse(url));
        if (response.statusCode != 200) {
          throw Exception('APK download failed with status ${response.statusCode}');
        }

        await file.writeAsBytes(response.bodyBytes, flush: true);
      }

      await _cleanupCachedApks(keepFileName: fileName);
      return filePath;
    } finally {
      _setStatus(_status.copyWith(isDownloading: false));
    }
  }

  Future<Directory> _getUpdateDirectory() async {
    final baseDirectory = await getApplicationSupportDirectory();
    final updateDirectory = Directory('${baseDirectory.path}/updates');

    if (!await updateDirectory.exists()) {
      await updateDirectory.create(recursive: true);
    }

    return updateDirectory;
  }

  Future<void> _cleanupCachedApks({required String keepFileName}) async {
    try {
      final directory = await _getUpdateDirectory();
      if (!await directory.exists()) {
        return;
      }

      for (final entry in directory.listSync()) {
        if (entry is File && entry.path.endsWith('.apk') && !entry.path.endsWith(keepFileName)) {
          await entry.delete();
        }
      }
    } catch (e) {
      debugPrint('Error cleaning cached APKs: $e');
    }
  }

  bool _isNewerVersion(String current, String latest) {
    final currentParts = current.split('.').map(int.parse).toList();
    final latestParts = latest.split('.').map(int.parse).toList();
    final maxLength = currentParts.length > latestParts.length ? currentParts.length : latestParts.length;

    for (var i = 0; i < maxLength; i++) {
      final currentPart = i < currentParts.length ? currentParts[i] : 0;
      final latestPart = i < latestParts.length ? latestParts[i] : 0;

      if (latestPart > currentPart) {
        return true;
      }
      if (latestPart < currentPart) {
        return false;
      }
    }

    return false;
  }

  void _setStatus(UpdateStatus nextStatus) {
    _status = nextStatus;
    notifyListeners();
  }
}

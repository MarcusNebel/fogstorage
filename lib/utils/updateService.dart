import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_filex/open_filex.dart';
import 'package:permission_handler/permission_handler.dart';

class UpdateService {
  // Ersetze dies mit deinen GitHub-Daten
  final String owner = "MarcusNebel";
  final String repo = "fogstorage";

  Future<void> checkForUpdates() async {
    try {
      // 1. Aktuelle App-Version holen
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      String currentVersion = packageInfo.version; // z.B. "1.0.0"

      // 2. Temporären Ordner aufräumen (Alte APKs löschen)
      await _cleanOldApks();

      // 3. Neuesten Release von GitHub abfragen
      final url = Uri.parse('https://api.github.com/repos/$owner/$repo/releases/latest');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        String latestVersion = data['tag_name'].toString().replaceAll('v', ''); // Entfernt ein eventuelles 'v' vor der Versionsnummer

        // Versionen vergleichen
        if (_isNewerVersion(currentVersion, latestVersion)) {
          // Finde den APK-Link in den Assets des Releases
          var assets = data['assets'] as List;
          var apkAsset = assets.firstWhere(
            (asset) => asset['name'].toString().endsWith('.apk'),
            orElse: () => null,
          );

          if (apkAsset != null) {
            String downloadUrl = apkAsset['browser_download_url'];
            String fileName = apkAsset['name'];
            
            // 4. APK herunterladen und installieren
            await _downloadAndInstallApk(downloadUrl, fileName);
          }
        }
      }
    } catch (e) {
      print("Fehler beim Update-Check: $e");
    }
  }

  // Einfacher Versionsvergleich (z.B. "1.0.0" vs "1.1.0")
  bool _isNewerVersion(String current, String latest) {
    List<int> currentParts = current.split('.').map(int.parse).toList();
    List<int> latestParts = latest.split('.').map(int.parse).toList();

    for (int i = 0; i < currentParts.length; i++) {
      if (latestParts[i] > currentParts[i]) return true;
      if (latestParts[i] < currentParts[i]) return false;
    }
    return false;
  }

  // APK herunterladen und ausführen
  Future<void> _downloadAndInstallApk(String url, String fileName) async {
    // Berechtigung für die Installation prüfen/anfordern (ab Android 8+ wichtig)
    if (await Permission.requestInstallPackages.request().isGranted) {
      Directory tempDir = await getTemporaryDirectory();
      String filePath = "${tempDir.path}/$fileName";
      File file = File(filePath);

      // Prüfen, ob die Datei bereits heruntergeladen wurde
      if (!await file.exists()) {
        print("Lade Update herunter...");
        var response = await http.get(Uri.parse(url));
        await file.writeAsBytes(response.bodyBytes);
        print("Download abgeschlossen.");
      } else {
        print("APK existiert bereits im Cache, starte Installation.");
      }

      // APK ausführen / Installation starten
      await OpenFilex.open(filePath);
    } else {
      print("Berechtigung zur Installation wurde verweigert.");
    }
  }

  // Temporäre APKs löschen
  Future<void> _cleanOldApks() async {
    try {
      Directory tempDir = await getTemporaryDirectory();
      if (await tempDir.exists()) {
        List<FileSystemEntity> files = tempDir.listSync();
        for (var file in files) {
          if (file is File && file.path.endsWith('.apk')) {
            await file.delete();
            print("Alte APK gelöscht: ${file.path}");
          }
        }
      }
    } catch (e) {
      print("Fehler beim Bereinigen alter APKs: $e");
    }
  }
}
import 'package:flutter/material.dart';
import 'package:fogstorage/gen_l10n/app_localizations.dart';
import 'package:fogstorage/utils/updateService.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String _appVersion = "Lädt...";
  final UpdateService _updateService = UpdateService();
  final String _githubUrl = "https://github.com/MarcusNebel/fogstorage";

  @override
  void initState() {
    super.initState();
    _loadAppVersion();
  }

  // Lädt die aktuelle Version der App
  Future<void> _loadAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      // Kombiniert Versionsnummer und Build-Nummer (z.B. 1.0.0+1)
      _appVersion = "${packageInfo.version}+${packageInfo.buildNumber}";
    });
  }

  // Öffnet den GitHub Link im Browser
  Future<void> _launchGitHub() async {
    final Uri url = Uri.parse(_githubUrl);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Link konnte nicht geöffnet werden.")),
        );
      }
    }
  }

  String _formatCheckedAt(DateTime? checkedAt) {
    if (checkedAt == null) {
      return AppLocalizations.of(context)!.update_status_not_checked;
    }

    return '${checkedAt.day.toString().padLeft(2, '0')}.${checkedAt.month.toString().padLeft(2, '0')}.${checkedAt.year} ${checkedAt.hour.toString().padLeft(2, '0')}:${checkedAt.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appbar_settings),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: Text(l10n.settings_version_label),
            trailing: Text(
              _appVersion,
              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            ),
          ),
          const Divider(),

          ListTile(
            leading: const Icon(Icons.code),
            title: Text(l10n.settings_github_title),
            subtitle: Text(l10n.settings_github_subtitle),
            trailing: const Icon(Icons.open_in_new),
            onTap: _launchGitHub,
          ),
          const Divider(),

          AnimatedBuilder(
            animation: _updateService,
            builder: (context, child) {
              final status = _updateService.status;

              final statusText = status.isChecking
                  ? l10n.update_status_checking
                  : status.lastError != null
                      ? l10n.update_error_prefix(status.lastError!)
                      : status.updateAvailable
                          ? (status.canInstall ? l10n.update_status_downloaded : l10n.update_status_update_available)
                          : (status.latestVersion == null ? l10n.update_status_not_checked : l10n.update_status_up_to_date);

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Card(
                  elevation: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.update_section_title,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 6),
                        Text(l10n.update_section_description),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            const Icon(Icons.system_update),
                            const SizedBox(width: 12),
                            Expanded(child: Text('${l10n.update_current_version_label}: ${status.currentVersion.isEmpty ? _appVersion : status.currentVersion}')),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.new_releases_outlined),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text('${l10n.update_latest_version_label}: ${status.latestVersion ?? '-'}'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.schedule),
                            const SizedBox(width: 12),
                            Expanded(child: Text('${l10n.update_last_checked_label}: ${_formatCheckedAt(status.lastChecked)}')),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.info_outline),
                            const SizedBox(width: 12),
                            Expanded(child: Text('${l10n.update_status_label}: $statusText')),
                          ],
                        ),
                        const SizedBox(height: 16),
                        if (status.isChecking || status.isDownloading)
                          const LinearProgressIndicator(),
                        if (status.isChecking || status.isDownloading) const SizedBox(height: 12),
                        Wrap(
                          spacing: 12,
                          runSpacing: 8,
                          children: [
                            ElevatedButton.icon(
                              onPressed: status.isChecking ? null : () => _updateService.checkForUpdates(autoInstall: false),
                              icon: const Icon(Icons.refresh),
                              label: Text(l10n.update_check_button),
                            ),
                            if (status.canInstall)
                              OutlinedButton.icon(
                                onPressed: () => _updateService.installDownloadedUpdate(),
                                icon: const Icon(Icons.download_done),
                                label: Text(l10n.update_install_button),
                              ),
                          ],
                        ),
                        if (status.updateAvailable && !status.canInstall)
                          Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: Text(
                              l10n.update_no_download,
                              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
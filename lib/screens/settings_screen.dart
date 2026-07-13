import 'package:flutter/material.dart';
import 'package:fogstorage/gen_l10n/app_localizations.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart'; // Für das Öffnen des GitHub-Links

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String _appVersion = "Lädt...";
  // Ersetze dies mit dem echten Link zu deinem Repository
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

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appbar_settings),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          // Sektion: Über die App
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text("App-Version"),
            trailing: Text(
              _appVersion,
              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            ),
          ),
          const Divider(),

          // Sektion: GitHub Repository
          ListTile(
            leading: const Icon(Icons.code),
            title: const Text("GitHub Repository"),
            subtitle: const Text("Quellcode und Releases ansehen"),
            trailing: const Icon(Icons.open_in_new),
            onTap: _launchGitHub,
          ),
          const Divider(),
        ],
      ),
    );
  }
}
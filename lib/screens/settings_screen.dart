import 'package:flutter/material.dart';
import 'package:fogstorage/gen_l10n/app_localizations.dart';

/// Settings Page
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n!.appbar_settings),
        centerTitle: true,
      ),
    );
  }
}

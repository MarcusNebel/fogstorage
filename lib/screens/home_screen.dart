import 'package:flutter/material.dart';
import 'package:fogstorage/gen_l10n/app_localizations.dart';

/// Home Page
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n!.appbar_home),
        centerTitle: true,
      ),
    );
  }
}
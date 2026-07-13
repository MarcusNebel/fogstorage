import 'package:flutter/material.dart';
import 'package:fogstorage/gen_l10n/app_localizations.dart';

/// Search Page
class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appbar_search),
        centerTitle: true,
      ),
    );
  }
}
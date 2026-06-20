import 'package:flutter/material.dart';
import 'package:fogstorage/gen_l10n/app_localizations.dart';

/// Add Page
class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return const Center(
      child: Text('Add Page'),
    );
  }
}
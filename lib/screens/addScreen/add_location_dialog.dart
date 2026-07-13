// lib/screens/widgets/add_location_dialog.dart
import 'package:flutter/material.dart';
import 'package:fogstorage/gen_l10n/app_localizations.dart';

class AddLocationDialog extends StatefulWidget {
  const AddLocationDialog({super.key});

  @override
  State<AddLocationDialog> createState() => _AddLocationDialogState();
}

class _AddLocationDialogState extends State<AddLocationDialog> {
  final _newLocationController = TextEditingController();

  @override
  void dispose() {
    _newLocationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return AlertDialog(
      title: Text(l10n.add_dialog_title),
      content: TextField(
        controller: _newLocationController,
        decoration: InputDecoration(hintText: l10n.add_dialog_hint),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(l10n.add_dialog_cancel),
        ),
        ElevatedButton(
          onPressed: () {
            final text = _newLocationController.text.trim();
            Navigator.pop(context, text.isNotEmpty ? text : null);
          },
          child: Text(l10n.add_dialog_add),
        ),
      ],
    );
  }
}
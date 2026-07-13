// lib/screens/add_screen.dart
import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as drift;
import 'package:fogstorage/gen_l10n/app_localizations.dart';
import 'package:fogstorage/utils/database.dart';

// Die neuen Widgets importieren:
import 'package:fogstorage/screens/addScreen/add_form_content.dart';
import 'package:fogstorage/screens/addScreen/add_location_dialog.dart';

class AddPage extends StatefulWidget {
  final AppDatabase database;
  final VoidCallback onSaveSuccess;

  const AddPage({
    super.key, 
    required this.database,
    required this.onSaveSuccess
  });

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _articleNumberController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();

  int _quantity = 1;
  final List<String> _locations = ['Regal A1', 'Regal B2', 'Kiste 3'];
  String? _selectedLocation;

  @override
  void dispose() {
    _titleController.dispose();
    _articleNumberController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  Future<void> _addNewLocation() async {
    final String? result = await showDialog<String>(
      context: context,
      builder: (context) => const AddLocationDialog(),
    );

    if (result != null) {
      setState(() {
        _locations.add(result);
        _selectedLocation = result;
      });
    }
  }

  Future<void> _saveToDatabase() async {
    final l10n = AppLocalizations.of(context)!;

    if (_formKey.currentState!.validate()) {
      final doublePrice = double.tryParse(_priceController.text.replaceAll(',', '.')) ?? 0.0;
      final priceInCent = (doublePrice * 100).toInt();

      final partCompanion = PartsListCompanion(
        title: drift.Value(_titleController.text),
        partnumber: drift.Value(_articleNumberController.text.isEmpty ? null : _articleNumberController.text),
        discription: drift.Value(_descriptionController.text.isEmpty ? null : _descriptionController.text),
        number: drift.Value(_quantity),
        price: drift.Value(priceInCent),
      );

      try {
        await widget.database.transaction(() async {
          final generatedPartId = await widget.database.into(widget.database.partsList).insert(partCompanion);

          final storageCompanion = StorageRoomsCompanion(
            partId: drift.Value(generatedPartId),
            roomName: drift.Value(_selectedLocation!),
          );

          await widget.database.into(widget.database.storageRooms).insert(storageCompanion);
        });

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(l10n.add_save_success)),
          );
          
          _titleController.clear();
          _articleNumberController.clear();
          _descriptionController.clear();
          _priceController.clear();
          setState(() {
            _quantity = 1;
            _selectedLocation = null;
          });

          widget.onSaveSuccess();
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(l10n.add_save_error('$e')), backgroundColor: Colors.red),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final appLocalizations = l10n!;

    return Scaffold(
      appBar: AppBar(
        title: Text(appLocalizations.appbar_add),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: AddFormContent(
          formKey: _formKey,
          titleController: _titleController,
          articleNumberController: _articleNumberController,
          descriptionController: _descriptionController,
          priceController: _priceController,
          quantity: _quantity,
          locations: _locations,
          selectedLocation: _selectedLocation,
          onIncrementQuantity: () => setState(() => _quantity++),
          onDecrementQuantity: () => setState(() => _quantity--),
          onSave: _saveToDatabase,
          onLocationChanged: (String? newValue) {
            if (newValue == 'ADD_NEW') {
              _addNewLocation();
            } else {
              setState(() {
                _selectedLocation = newValue;
              });
            }
          },
        ),
      ),
    );
  }
}
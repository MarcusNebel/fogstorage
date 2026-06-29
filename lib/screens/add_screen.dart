import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as drift;
import 'package:fogstorage/gen_l10n/app_localizations.dart';
import 'package:fogstorage/utils/database.dart';
// import 'package:fogstorage/database/database.dart'; 

class AddPage extends StatefulWidget {
  final AppDatabase database;

  const AddPage({super.key, required this.database});

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

  // Liste der verfügbaren Lagerplätze
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

  void _addNewLocation() {
    final newLocationController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Neuen Lagerplatz hinzufügen'),
          content: TextField(
            controller: newLocationController,
            decoration: const InputDecoration(hintText: 'Z.B. Regal C3'),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('Abbrechen')),
            ElevatedButton(
              onPressed: () {
                final text = newLocationController.text.trim();
                if (text.isNotEmpty) {
                  setState(() {
                    _locations.add(text);
                    _selectedLocation = text;
                  });
                }
                Navigator.pop(context);
              },
              child: const Text('Hinzufügen'),
            ),
          ],
        );
      },
    );
  }

  // Hier werden jetzt beide Tabellen befüllt
  Future<void> _saveToDatabase() async {
    if (_formKey.currentState!.validate()) {
      final doublePrice = double.tryParse(_priceController.text.replaceAll(',', '.')) ?? 0.0;
      final priceInCent = (doublePrice * 100).toInt();

      // 1. Companion für das Teil vorbereiten
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
            const SnackBar(content: Text('Teil und Lagerplatz erfolgreich verknüpft und gespeichert!')),
          );
          
          // HIER DIE ÄNDERUNG: Kein Navigator.pop(context) mehr!
          // Stattdessen leeren wir einfach die Textfelder für den nächsten Eintrag:
          _titleController.clear();
          _articleNumberController.clear();
          _descriptionController.clear();
          _priceController.clear();
          setState(() {
            _quantity = 1;
            _selectedLocation = null;
          });
          
          // Optional: Wenn du den Nutzer nach dem Speichern automatisch zur Liste schicken willst,
          // müssten wir den Index der NavigationBarComponent ändern. 
          // Am einfachsten ist es aber für den Anfang, die Felder zu leeren, damit der Nutzer sieht, dass es geklappt hat.
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Fehler beim Speichern: $e'), backgroundColor: Colors.red),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n?.appbar_add ?? 'Add'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Titel', border: OutlineInputBorder()),
                validator: (value) => value!.isEmpty ? 'Bitte Titel eingeben' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _articleNumberController,
                decoration: const InputDecoration(labelText: 'Artikelnummer', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                maxLines: 2,
                decoration: const InputDecoration(labelText: 'Beschreibung', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Anzahl', style: TextStyle(fontSize: 12, color: Colors.grey)),
                        const SizedBox(height: 4),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: _quantity > 1 ? () => setState(() => _quantity--) : null,
                              ),
                              Text('$_quantity', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () => setState(() => _quantity++),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 5,
                    child: TextFormField(
                      controller: _priceController,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      decoration: const InputDecoration(labelText: 'Preis (€)', border: OutlineInputBorder()),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                initialValue: _selectedLocation,
                decoration: const InputDecoration(labelText: 'Lagerplatz', border: OutlineInputBorder()),
                hint: const Text('Wähle einen Lagerplatz'),
                validator: (value) => (value == null || value == 'ADD_NEW') ? 'Bitte Lagerplatz wählen' : null,
                items: [
                  ..._locations.map((String location) {
                    return DropdownMenuItem<String>(
                      value: location,
                      child: Text(location),
                    );
                  }),
                  const DropdownMenuItem<String>(
                    value: 'ADD_NEW',
                    child: Row(
                      children: [
                        Icon(Icons.add, color: Colors.blue),
                        SizedBox(width: 8),
                        Text('Neu hinzufügen...', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
                onChanged: (String? newValue) {
                  if (newValue == 'ADD_NEW') {
                    _addNewLocation();
                  } else {
                    setState(() {
                      _selectedLocation = newValue;
                    });
                  }
                },
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _saveToDatabase,
                style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16)),
                child: const Text('In Datenbank speichern', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
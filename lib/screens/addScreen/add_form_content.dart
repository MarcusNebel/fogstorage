// lib/screens/widgets/add_form_content.dart
import 'package:flutter/material.dart';
import 'package:fogstorage/gen_l10n/app_localizations.dart';

class AddFormContent extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController titleController;
  final TextEditingController articleNumberController;
  final TextEditingController descriptionController;
  final TextEditingController priceController;
  final int quantity;
  final List<String> locations;
  final String? selectedLocation;
  final VoidCallback onIncrementQuantity;
  final VoidCallback onDecrementQuantity;
  final ValueChanged<String?> onLocationChanged;
  final VoidCallback onSave;

  const AddFormContent({
    super.key,
    required this.formKey,
    required this.titleController,
    required this.articleNumberController,
    required this.descriptionController,
    required this.priceController,
    required this.quantity,
    required this.locations,
    required this.selectedLocation,
    required this.onIncrementQuantity,
    required this.onDecrementQuantity,
    required this.onLocationChanged,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: titleController,
            decoration: InputDecoration(labelText: l10n.add_title_label, border: const OutlineInputBorder()),
            validator: (value) => value!.isEmpty ? l10n.add_title_required : null,
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: articleNumberController,
            decoration: InputDecoration(labelText: l10n.add_article_number_label, border: const OutlineInputBorder()),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: descriptionController,
            maxLines: 2,
            decoration: InputDecoration(labelText: l10n.add_description_label, border: const OutlineInputBorder()),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(l10n.add_quantity_label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
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
                            onPressed: quantity > 1 ? onDecrementQuantity : null,
                          ),
                          Text('$quantity', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: onIncrementQuantity,
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
                  controller: priceController,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(labelText: l10n.add_price_label, border: const OutlineInputBorder()),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            initialValue: selectedLocation,
            decoration: InputDecoration(labelText: l10n.add_location_label, border: const OutlineInputBorder()),
            hint: Text(l10n.add_location_hint),
            validator: (value) => (value == null || value == 'ADD_NEW') ? l10n.add_location_required : null,
            items: [
              ...locations.map((String location) {
                return DropdownMenuItem<String>(
                  value: location,
                  child: Text(location),
                );
              }),
              DropdownMenuItem<String>(
                value: 'ADD_NEW',
                child: Row(
                  children: [
                    const Icon(Icons.add, color: Colors.blue),
                    const SizedBox(width: 8),
                    Text(l10n.add_new_location, style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
            onChanged: onLocationChanged,
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: onSave,
            style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16)),
            child: Text(l10n.add_save_button, style: const TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
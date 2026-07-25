import 'package:flutter/material.dart';
import 'package:fogstorage/appTheme.dart';
import 'package:fogstorage/gen_l10n/app_localizations.dart';
import 'package:fogstorage/utils/database.dart'; // Import für deine Datenbank-Klassen
import 'package:fogstorage/appTheme.dart';

class HomePage extends StatelessWidget {
  final AppDatabase database; // Datenbank-Instanz wird von außen übergeben

  const HomePage({super.key, required this.database});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appbar_home),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      // Der StreamBuilder lauscht live auf Änderungen in der partsList-Tabelle
      body: StreamBuilder<List<PartsListData>>(
        stream: database.select(database.partsList).watch(),
        builder: (context, snapshot) {
          final l10n = AppLocalizations.of(context)!;

          // 1. Lade-Zustand (wenn die DB noch abgefragt wird)
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // 2. Fehler-Zustand
          if (snapshot.hasError) {
            return Center(child: Text(l10n.home_load_error('${snapshot.error}')));
          }

          // 3. Zustand: Keine Daten vorhanden
          final parts = snapshot.data;
          if (parts == null || parts.isEmpty) {
            return Center(
              child: Text(
                l10n.home_empty_state,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
            );
          }

          // 4. Erfolg: Liste mit Daten anzeigen
          return ListView.builder(
            itemCount: parts.length,
            padding: const EdgeInsets.all(8.0),
            itemBuilder: (context, index) {
              final part = parts[index];
              
              // Preis von Cent wieder in Euro umrechnen (€0.00 Format)
              final priceInEuro = part.price != null ? (part.price! / 100).toStringAsFixed(2) : '0.00';

              return Card(
                elevation: 2,
                margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    child: Text('${part.number}x', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                  ),
                  title: Text(part.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(
                    '${l10n.home_article_number_prefix(part.partnumber ?? '-')} \n${part.discription ?? ""}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Text('$priceInEuro €', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
                  isThreeLine: part.discription != null,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
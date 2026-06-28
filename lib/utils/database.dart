import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

// Die g.dart Datei wird gleich generiert
part 'database.g.dart';

// 1. Deine Tabelle
class PartsList extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1, max: 50)();
  TextColumn get partnumber => text().nullable()();
  TextColumn get discription => text().nullable()();
  IntColumn get number => integer().withDefault(const Constant(1))();
  IntColumn get price => integer().nullable()();
  TextColumn get storageroom => text().nullable()();
}

class StorageRooms extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get partId => integer()();
}

// 2. Die Datenbank-Klasse
@DriftDatabase(tables: [PartsList])
class AppDatabase extends _$AppDatabase {
  // Moderner Dart-Syntax für den Konstruktor (behebt die Warnung "use_super_parameters")
  AppDatabase(super.e);

  @override
  int get schemaVersion => 1;
}

// 3. Die korrekte Verbindungsfunktion (ohne veraltete RuntimeOptions)
LazyDatabase openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
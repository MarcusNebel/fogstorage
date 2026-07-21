// main.dart
import 'package:flutter/material.dart';
import 'package:fogstorage/app.dart';
import 'package:fogstorage/utils/database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = AppDatabase(openConnection());

  runApp(MainApp(database: database));
}
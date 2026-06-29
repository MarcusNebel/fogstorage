// main.dart
import 'package:flutter/material.dart';
import 'package:fogstorage/components/navigation_bar_view.dart'; // Import zur Navigationsleiste
import 'package:fogstorage/utils/database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = AppDatabase(openConnection());

  runApp(MyApp(database: database));
}

class MyApp extends StatelessWidget {
  final AppDatabase database;

  const MyApp({super.key, required this.database});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FogStorage',
      theme: ThemeData(primarySwatch: Colors.blue),
      // Hier rufen wir jetzt deine echte Navigationskomponente auf:
      home: NavigationBarComponent(database: database),
    );
  }
}
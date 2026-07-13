import 'package:flutter/material.dart';
import 'package:fogstorage/components/navigation_bar_view.dart';
import 'package:fogstorage/gen_l10n/app_localizations.dart';
import 'package:fogstorage/utils/database.dart';
import 'package:fogstorage/utils/updateService.dart';

// 1. Aus StatelessWidget wird ein StatefulWidget
class MainApp extends StatefulWidget {
  final AppDatabase database;

  const MainApp({super.key, required this.database});

  @override
  State<MainApp> createState() => _MainAppState();
}

// 2. Die dazugehörige State-Klasse
class _MainAppState extends State<MainApp> {
  
  @override
  void initState() { // Richtig geschrieben!
    super.initState();
    // Update-Prüfung beim Start ausführen
    UpdateService().checkForUpdates();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: const [
        Locale('en'),
        Locale('de'),
      ],
      // Wichtig: Auf Variablen aus dem Widget greift man hier mit "widget.name" zu
      home: NavigationBarComponent(database: widget.database),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:fogstorage/components/navigation_bar_view.dart';
import 'package:fogstorage/gen_l10n/app_localizations.dart';
import 'package:fogstorage/utils/database.dart';
import 'package:fogstorage/utils/updateService.dart';
import 'dart:async';

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
  void initState() {
    super.initState();
    unawaited(UpdateService().checkForUpdates(autoInstall: false));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateTitle: (context) => AppLocalizations.of(context)!.app_name,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: NavigationBarComponent(database: widget.database),
    );
  }
}
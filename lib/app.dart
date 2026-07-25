import 'package:flutter/material.dart';
import 'package:fogstorage/components/navigation_bar_view.dart';
import 'package:fogstorage/gen_l10n/app_localizations.dart';
import 'package:fogstorage/utils/database.dart';
import 'package:fogstorage/utils/updateService.dart';
import 'dart:async';
import 'package:fogstorage/appTheme.dart';

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
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateTitle: (context) => AppLocalizations.of(context)!.app_name,
      home: NavigationBarComponent(database: widget.database),
    );
  }
}
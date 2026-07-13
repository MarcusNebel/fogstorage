import 'package:flutter/material.dart';
import 'package:fogstorage/components/navigation_bar_view.dart';
import 'package:fogstorage/gen_l10n/app_localizations.dart';
import 'package:fogstorage/utils/database.dart';

class MainApp extends StatelessWidget {
  final AppDatabase database;

  const MainApp({super.key, required this.database});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: [
        Locale('en'),
        Locale('de'),
      ],
      home: NavigationBarComponent(database: database),
    );
  }
}

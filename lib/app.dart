import 'package:flutter/material.dart';
import 'package:fogstorage/components/navigation_bar_view.dart';
import 'package:fogstorage/gen_l10n/app_localizations.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: const [
        Locale('en'),
        Locale('de'),
      ],
      home: NavigationBarComponent(),
    );
  }
}

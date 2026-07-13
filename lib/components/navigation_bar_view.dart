// navigation_bar_view.dart
import 'package:flutter/material.dart';
import 'package:fogstorage/gen_l10n/app_localizations.dart';

import 'package:fogstorage/screens/home_screen.dart';
import 'package:fogstorage/screens/search_screen.dart';
import 'package:fogstorage/screens/addScreen/add_screen.dart';
import 'package:fogstorage/screens/settings_screen.dart';
import 'package:fogstorage/utils/database.dart'; // Datenbank-Import hinzufügen

class NavigationBarComponent extends StatefulWidget {
  final AppDatabase database; // Datenbank hier deklarieren

  const NavigationBarComponent({super.key, required this.database}); // Konstruktor erweitern

  @override
  State<NavigationBarComponent> createState() => _NavigationBarComponentState();
}

class _NavigationBarComponentState extends State<NavigationBarComponent> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    // Die Liste wird hierhin verschoben, damit wir auf 'widget.database' zugreifen können
    final List<Widget> pages = [
      HomePage(database: widget.database,),
      const SearchPage(),

      AddPage(
        database: widget.database,
        onSaveSuccess: () {
          setState(() {
            currentPageIndex = 0;
          });
        },
      ),

      const SettingsPage(),
    ];

    return Scaffold(
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        destinations: <Widget>[
          NavigationDestination(
            icon: const Icon(Icons.home),
            label: l10n.navbar_home,
          ),
          NavigationDestination(
            icon: const Icon(Icons.search),
            label: l10n.navbar_search,
          ),
          NavigationDestination(
            icon: const Icon(Icons.add),
            label: l10n.navbar_add,
          ),
          NavigationDestination(
            icon: const Icon(Icons.settings),
            label: l10n.navbar_settings,
          )
        ],
      ),
      body: pages[currentPageIndex],
    );
  }
}
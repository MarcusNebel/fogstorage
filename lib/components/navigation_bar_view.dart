import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fogstorage/gen_l10n/app_localizations.dart';

import 'package:fogstorage/screens/home_screen.dart';
import 'package:fogstorage/screens/search_screen.dart';
import 'package:fogstorage/screens/add_screen.dart';
import 'package:fogstorage/screens/settings_screen.dart';

/// Navigation Bar Component with only selected labels shown.
class NavigationBarComponent extends StatefulWidget {
  const NavigationBarComponent({super.key});

  @override
  State<NavigationBarComponent> createState() => _NavigationBarComponentState();
}

class _NavigationBarComponentState extends State<NavigationBarComponent> {
  int currentPageIndex = 0;

  final List<Widget> pages = [
    const HomePage(),
    const SearchPage(),
    const AddPage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

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
            icon: Icon(Icons.home),
            label: l10n!.navbar_home,
          ),
          NavigationDestination(
            icon: Icon(Icons.search),
            label: l10n.navbar_search,
          ),
          NavigationDestination(
            icon: Icon(Icons.add),
            label: l10n.navbar_add,
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: l10n.navbar_settings,
          )
        ],
      ),
      body: pages[currentPageIndex],
    );
  }
}

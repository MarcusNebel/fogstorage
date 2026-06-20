import 'package:flutter/material.dart';

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
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Startseite',
          ),
          NavigationDestination(
            icon: Icon(Icons.search),
            label: 'Suchen',
          ),
          NavigationDestination(
            icon: Icon(Icons.add),
            label: 'Hinzufügen',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: 'Einstellungen',
          )
        ],
      ),
      body: pages[currentPageIndex],
    );
  }
}

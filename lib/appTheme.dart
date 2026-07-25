import 'package:flutter/material.dart';

class AppTheme {
  static const Color _primaryLight = Color(0xFFff8521);
  static const Color _backgroundLight = Color(0xFFfdfdfd);
  static const Color _surfaceLight = Colors.white;

  static const Color _primaryDark = Color(0xFFff8a2a);
  static const Color _backgroundDark = Color(0xFF0f141b);
  static const Color _surfaceDark = Color(0xFF1c2127);


  // --- Light Theme ---
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: _backgroundLight,
      colorScheme: const ColorScheme.light(
        primary: _primaryLight,
        surface: _surfaceLight,
        background: _backgroundLight
      ),
      navigationBarTheme: NavigationBarThemeData(
        indicatorColor: _primaryLight
      )
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: _backgroundDark,
      colorScheme: const ColorScheme.dark(
        primary: _primaryDark,
        surface: _surfaceDark,
        background: _backgroundDark
      ),
      navigationBarTheme: NavigationBarThemeData(
        indicatorColor: _primaryDark
      )
    );
  }
}
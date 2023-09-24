import 'package:flutter/material.dart';

class LightTheme {
  ThemeData theme = ThemeData(
    appBarTheme: AppBarTheme(),
    scaffoldBackgroundColor: Colors.lightBlue.shade100,
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: Colors.green),
    colorScheme: const ColorScheme.light().copyWith(
      onPrimary: Colors.amber,
      onSecondary: Colors.cyan,
    ),
  );
}

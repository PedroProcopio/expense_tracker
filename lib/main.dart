import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

var kColorSchemeDark = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 5, 99, 155),
  brightness: Brightness.dark,
);

void main() {
  runApp(
    MaterialApp(
      darkTheme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorSchemeDark,
        scaffoldBackgroundColor: kColorSchemeDark.background,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorSchemeDark.primary,
          foregroundColor: kColorSchemeDark.onPrimary,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorSchemeDark.tertiaryContainer,
          ),
        ),
        cardTheme: const CardTheme().copyWith(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          color: kColorSchemeDark.secondaryContainer,
        ),
        textTheme: const TextTheme().copyWith(
          titleLarge: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          bodyMedium: const TextStyle(
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
      ),
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.primary,
          foregroundColor: kColorScheme.onPrimary,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.tertiaryContainer,
          ),
        ),
        cardTheme: const CardTheme().copyWith(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          color: kColorScheme.secondaryContainer,
        ),
        textTheme: const TextTheme().copyWith(
          titleLarge: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          bodyMedium: const TextStyle(
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(
            color: Colors.black, // Color del texto de los inputs
          ),
        ),
        textSelectionTheme: const TextSelectionThemeData(
          selectionColor:
              Colors.black, // Color del texto seleccionado en los inputs
        ),
      ),
      home: const Expenses(),
    ),
  );
}

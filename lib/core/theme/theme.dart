import 'package:flutter/material.dart';
import 'package:flutter_application/core/theme/theme_cubit.dart';

ThemeData buildLightTheme(Color seed) {
  final scheme = ColorScheme.fromSeed(
    seedColor: seed,
    brightness: Brightness.light,
  );
  return ThemeData(
    useMaterial3: true,
    colorScheme: scheme,
    appBarTheme: const AppBarTheme(elevation: 0, scrolledUnderElevation: 0),
    navigationBarTheme: const NavigationBarThemeData(
      surfaceTintColor: Colors.transparent,
    ),
    snackBarTheme: SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      backgroundColor: scheme.inverseSurface,
      contentTextStyle: TextStyle(color: scheme.onInverseSurface),
      actionTextColor: scheme.inversePrimary,
    ),
  );
}

ThemeData buildDarkTheme(Color seed) {
  final scheme = ColorScheme.fromSeed(
    seedColor: seed,
    brightness: Brightness.dark,
  );
  return ThemeData(
    useMaterial3: true,
    colorScheme: scheme,
    appBarTheme: const AppBarTheme(elevation: 0, scrolledUnderElevation: 0),
    navigationBarTheme: const NavigationBarThemeData(
      surfaceTintColor: Colors.transparent,
    ),
    snackBarTheme: SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      backgroundColor: scheme.inverseSurface,
      contentTextStyle: TextStyle(color: scheme.onInverseSurface),
      actionTextColor: scheme.inversePrimary,
    ),
  );
}

extension AppThemeModeX on AppThemeMode {
  ThemeMode toThemeMode() => switch (this) {
    AppThemeMode.light => ThemeMode.light,
    AppThemeMode.dark => ThemeMode.dark,
    AppThemeMode.system => ThemeMode.system,
  };
}

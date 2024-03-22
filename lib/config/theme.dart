import 'package:flutter/material.dart';

import 'colors.dart';
import 'utils/extensions/theme_ex.dart';

class ThemeConfig {
  static List<ThemeData> allThemes() {
    final defaultTheme = ThemeData(
      fontFamily: "Raleway",
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.white,
      ),
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.primary,
      textTheme: TextTheme(
        headlineLarge: const TextStyle(
          fontSize: 96,
          fontFamily: "Goku",
        ),
        headlineMedium: const TextStyle(
          fontSize: 70,
          fontWeight: semiBold,
          fontFamily: "Goku",
        ),
        headlineSmall: const TextStyle(
          fontSize: 60,
          fontWeight: bold,
          fontFamily: "Goku",
        ),
        titleLarge: const TextStyle(
          fontSize: 48,
          fontWeight: bold,
          fontFamily: "Goku",
        ),
        titleMedium: const TextStyle(
          // fontSize: s38,
          fontWeight: bold,
        ),
        titleSmall: const TextStyle(
          // fontSize: s32,
          fontWeight: bold,
        ),
        labelLarge: const TextStyle(
          fontSize: 48,
          fontWeight: bold,
          fontFamily: "Goku",
        ),
        bodyLarge: const TextStyle(
          fontSize: 18,
          fontWeight: medium,
        ),
        bodyMedium: const TextStyle(
          fontSize: 12,
          fontWeight: medium,
        ),
        bodySmall: TextStyle(
          fontSize: 10,
          fontWeight: medium,
        ),
      ).apply(
        bodyColor: AppColors.white,
        displayColor: AppColors.white,
        decorationColor: AppColors.white,
      ),
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.primary,
        onPrimary: AppColors.primary,
        secondary: AppColors.secondary,
        onSecondary: AppColors.red,
        error: AppColors.red,
        onError: AppColors.red,
        background: AppColors.primary,
        onBackground: AppColors.primary,
        surface: AppColors.primary,
        onSurface: AppColors.primary,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        alignLabelWithHint: true,
      ),
    );

    return [
      defaultTheme,
      modifyThemeColor(defaultTheme, Color(0xffEF476F)),
      modifyThemeColor(defaultTheme, Color(0xff6A47EF)),
      modifyThemeColor(defaultTheme, Color(0xff479FEF)),
      modifyThemeColor(defaultTheme, Color(0xffCBAC40)),
      modifyThemeColor(defaultTheme, Color(0xffC4DC662)),
    ];
  }

  static modifyThemeColor(ThemeData theme, Color color) {
    return theme.copyWith(
      colorScheme: theme.colorScheme.copyWith(secondary: color),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:muzammil_hussain/config/colors.dart';

const bold = FontWeight.w700;
const semiBold = FontWeight.w600;
const medium = FontWeight.w500;
const light = FontWeight.w300;

extension ThemeEx on BuildContext {
  ThemeData theme() {
    // TODOO Make this Dynamic

    return ThemeData(
      fontFamily: "Raleway",
      appBarTheme: appBarTheme(),
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.primary,
      textTheme: textTheme().apply(
        bodyColor: AppColors.white,
        displayColor: AppColors.white,
        decorationColor: AppColors.white,
      ),
      textSelectionTheme: textSelectionTheme(),
      colorScheme: colorScheme(),
      iconTheme: iconTheme(),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      inputDecorationTheme: inputDecorationTheme(),
    );
  }

  AppBarTheme appBarTheme() {
    return AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: Theme.of(this).textTheme.labelLarge!.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.white,
          ),
      foregroundColor: AppColors.white,
    );
  }

  InputDecorationTheme inputDecorationTheme() {
    return const InputDecorationTheme(
      filled: true,
      // fillColor: kTransparent,
      alignLabelWithHint: true,
    );
  }

  TextTheme textTheme() {
    return Theme.of(this).textTheme.copyWith(
          headlineLarge: headlineLarge,
          headlineMedium: headlineMedium,
          headlineSmall: headlineSmall,
          titleLarge: titleLarge,
          titleMedium: titleMedium,
          titleSmall: titleSmall,
          labelLarge: labelLarge,
          bodyLarge: bodyLarge,
          bodyMedium: bodyMedium,
          bodySmall: bodySmall,
        );
  }

  TextStyle get headlineLarge => const TextStyle(
        fontSize: 96,
        fontFamily: "Goku",
      );
  TextStyle get headlineMedium => const TextStyle(
        fontSize: 70,
        fontWeight: semiBold,
        fontFamily: "Goku",
      );
  TextStyle get headlineSmall => const TextStyle(
        fontSize: 60,
        fontWeight: bold,
        fontFamily: "Goku",
      );
  TextStyle get titleLarge => const TextStyle(
        fontSize: 48,
        fontWeight: bold,
        fontFamily: "Goku",
      );
  TextStyle get titleMedium => const TextStyle(
        // fontSize: s38,
        fontWeight: bold,
      );
  TextStyle get titleSmall => const TextStyle(
        // fontSize: s32,
        fontWeight: bold,
      );
  TextStyle get labelLarge => const TextStyle(
        fontSize: 48,
        fontWeight: bold,
        fontFamily: "Goku",
      );
  TextStyle get bodyLarge => const TextStyle(
        fontSize: 18,
        fontWeight: medium,
      );
  TextStyle get bodyMedium => const TextStyle(
        fontSize: 12,
        fontWeight: medium,
      );
  TextStyle get bodySmall => const TextStyle(
        // fontSize: s12,
        fontWeight: medium,
      );

  TextSelectionThemeData textSelectionTheme() {
    return const TextSelectionThemeData();
  }

  IconThemeData iconTheme() {
    return const IconThemeData(
        // color: kBlack,
        );
  }

  ColorScheme colorScheme() {
    return const ColorScheme(
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
    );
  }
}

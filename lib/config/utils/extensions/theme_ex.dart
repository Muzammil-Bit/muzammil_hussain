import 'package:flutter/material.dart';

const bold = FontWeight.w700;
const semiBold = FontWeight.w600;
const medium = FontWeight.w500;
const light = FontWeight.w300;

extension ThemeEx on BuildContext {
  ThemeData theme() {
    return Theme.of(this);

    // return ThemeData(
    //   fontFamily: "Raleway",
    //   appBarTheme: appBarTheme(),
    //   useMaterial3: true,
    //   scaffoldBackgroundColor: AppColors.primary,
    //   textTheme: textTheme().apply(
    //     bodyColor: AppColors.white,
    //     displayColor: AppColors.white,
    //     decorationColor: AppColors.white,
    //   ),
    //   textSelectionTheme: textSelectionTheme(),
    //   colorScheme: colorScheme(),
    //   iconTheme: iconTheme(),
    //   visualDensity: VisualDensity.adaptivePlatformDensity,
    //   inputDecorationTheme: inputDecorationTheme(),
    // );
  }

  // AppBarTheme appBarTheme() {
  //   return AppBarTheme(
  //     backgroundColor: Colors.transparent,
  //     elevation: 0,
  //     titleTextStyle: Theme.of(this).textTheme.labelLarge!.copyWith(
  //           fontWeight: FontWeight.w700,
  //           color: AppColors.white,
  //         ),
  //     foregroundColor: AppColors.white,
  //   );
  // }

  InputDecorationTheme inputDecorationTheme() {
    return const InputDecorationTheme(
      filled: true,
      alignLabelWithHint: true,
    );
  }
}

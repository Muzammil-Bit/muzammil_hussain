import 'dart:math';

import 'package:delightful_toast/delight_toast.dart';
import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  bool get isTablet =>
      MediaQuery.of(this).size.width <= 1025 &&
      MediaQuery.of(this).size.width >= 770;

  bool get isMobile => MediaQuery.of(this).size.width <= 770;

  bool get isDeskTop => MediaQuery.of(this).size.width > 1025;

  T getResponsiveValue<T>(List<T> number) {
    assert(number.length == 3);

    if (isMobile) return number[0];
    if (isTablet) return number[1];

    return number[2];
  }

  double textScaleFactor({double maxTextScaleFactor = 2}) {
    final width = MediaQuery.of(this).size.width;
    double val = (width / 1400) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }

  void showToast(String message) {
    DelightToastBar(
      snackbarDuration: Duration(seconds: 2),
      autoDismiss: true,
      builder: (context) => Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.secondary,
                blurRadius: 5,
                spreadRadius: 1,
              )
            ],
          ),
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Text(
            message,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ).show(this);
  }
}

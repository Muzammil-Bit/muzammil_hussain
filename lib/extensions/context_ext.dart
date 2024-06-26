import 'dart:math';

import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  // push(Widget widget) {
  //   Navigator.of(this).push(MaterialPageRoute(builder: (_) => widget));
  // }

  // pushReplacement(Widget widget) {
  //   Navigator.of(this)
  //       .pushReplacement(MaterialPageRoute(builder: (_) => widget));
  // }

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
}

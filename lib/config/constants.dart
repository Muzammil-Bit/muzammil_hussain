import 'package:flutter/material.dart';

class Constants {
  static const Duration smallDelay = Duration(milliseconds: 1500);
  static const Duration mediumDelay = Duration(milliseconds: 3000);

  static const mediumAnimationSpeed = Duration(milliseconds: 400);

  static const email = 'muzammil0301@gmail.com';
  static const phoneNumber = '+92 3085098342';
  static const address = 'Gulberg 2, Lahore, Pakistan';

  static const linkedInUrl = 'https://www.linkedin.com/in/muzammil-developer/';
  static const xUrl = 'https://x.com/muzammil0301';
  static const githubUrl = 'https://github.com/muzammil-Bit/';

  static outLinedText(BuildContext context, {double strokeWidth = 1}) {
    return Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..color = Theme.of(context).colorScheme.secondary;
  }
}

import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  push(Widget widget) {
    Navigator.of(this).push(MaterialPageRoute(builder: (_) => widget));
  }

  // bool isTablet => MediaQuery.of(this).size.width >
}

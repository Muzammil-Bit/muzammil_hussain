import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'config/utils/extensions/theme_ex.dart';
import 'providers/animated_mouse_position_provider.dart';
import 'view/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Muzammil Hussain',
      debugShowCheckedModeBanner: false,
      theme: context.theme(),
      home: const HomePage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:muzammil_hussain/view/splash_page.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

import 'providers/theme_provider.dart';
import 'repositories/theme_repo.dart';
import 'view/pages/home/home_page.dart';

void main() async {
  final ThemeRepo themeRepo = ThemeRepo(0);
  setPathUrlStrategy();
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(themeRepo),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, provider, child) {
      return MaterialApp(
        title: 'Muzammil Hussain',
        debugShowCheckedModeBanner: false,
        theme: provider.currentTheme,
        // home: const HomePage(),
        home: SplashPage(),
      );
    });
  }
}

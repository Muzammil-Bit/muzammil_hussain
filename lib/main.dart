import 'package:flutter/material.dart';
import 'package:muzammil_hussain/view/pages/about/about_page.dart';
import 'package:muzammil_hussain/view/pages/contact/contact_page.dart';
import 'package:muzammil_hussain/view/pages/home/views/contact_me.dart';
import 'package:muzammil_hussain/view/pages/works/works_page.dart';
import 'package:muzammil_hussain/view/splash_page.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

import 'providers/app_state_provider.dart';
import 'repositories/theme_repo.dart';
import 'view/pages/home/home_page.dart';

void main() async {
  final ThemeRepo themeRepo = ThemeRepo(0);
  setPathUrlStrategy();
  runApp(ChangeNotifierProvider(
    create: (context) => AppStateProvider(themeRepo),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateProvider>(builder: (context, provider, child) {
      return MaterialApp(
        title: 'Muzammil Hussain',
        debugShowCheckedModeBanner: false,
        theme: provider.currentTheme,
        // home: AboutPage(),
        // home: const HomePage(),
        // home: SplashPage(),
        // home: ContactPage(),
        home: WorksPage(),
      );
    });
  }
}

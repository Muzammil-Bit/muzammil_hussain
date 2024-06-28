import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:provider/provider.dart';

import 'providers/app_state_provider.dart';
import 'repositories/theme_repo.dart';
import 'view/router/router.dart';

void main() async {
  final ThemeRepo themeRepo = ThemeRepo(0);
  usePathUrlStrategy();

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
      return MaterialApp.router(
        title: 'Muzammil Hussain',
        debugShowCheckedModeBanner: false,
        theme: provider.currentTheme,
        routerConfig: router,
      );
    });
  }
}

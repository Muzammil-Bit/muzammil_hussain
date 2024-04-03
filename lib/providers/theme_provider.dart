import 'package:flutter/material.dart';

import '../config/theme.dart';
import '../repositories/theme_repo.dart';

class ThemeProvider extends ChangeNotifier {
  final ThemeRepo _themeRepo;

  ThemeProvider(this._themeRepo) {
    Future.delayed(Duration(milliseconds: 300), () {
      initCurrentTheme();
    });
  }

  initCurrentTheme() async {
    await _themeRepo.getThemeFromDb();
    notifyListeners();
  }

  ThemeData get currentTheme =>
      ThemeConfig.allThemes()[_themeRepo.currentTheme];
  int get currentIndex => _themeRepo.currentTheme;

  updateThemeIndex(int index) async {
    await _themeRepo.updateTheme(index);
    notifyListeners();
  }
}

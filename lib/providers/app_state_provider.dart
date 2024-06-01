import 'package:flutter/material.dart';

import '../config/theme.dart';
import '../repositories/theme_repo.dart';

class AppStateProvider extends ChangeNotifier {
  final ThemeRepo _themeRepo;

  bool _isNavBarOpen = false;
  bool get isNavBarOpen => _isNavBarOpen;

  AppStateProvider(this._themeRepo) {
    Future.delayed(Duration(milliseconds: 300), () {
      initCurrentTheme();
    });
  }

  toggleNav() {
    _isNavBarOpen = !_isNavBarOpen;
    notifyListeners();
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

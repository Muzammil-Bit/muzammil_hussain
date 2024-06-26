import 'package:flutter/material.dart';

import '../config/theme.dart';
import '../repositories/theme_repo.dart';

class AppStateProvider extends ChangeNotifier {
  AppStateProvider(this._themeRepo) {
    Future.delayed(Duration(milliseconds: 300), () {
      initCurrentTheme();
    });
  }

  bool _isNavBarOpen = false;
  bool _isSplashAnimationDone = false;
  final ThemeRepo _themeRepo;

  bool get isSplashAnimationDone => _isSplashAnimationDone;

  bool get isNavBarOpen => _isNavBarOpen;

  toggleNav() {
    _isNavBarOpen = !_isNavBarOpen;
    notifyListeners();
  }

  setNavAnimationStatus(bool status) {
    _isSplashAnimationDone = status;
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

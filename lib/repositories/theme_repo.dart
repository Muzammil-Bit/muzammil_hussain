import 'package:shared_preferences/shared_preferences.dart';

class ThemeRepo {
  int _currentlySelectedThemeIndex = 0;

  ThemeRepo(this._currentlySelectedThemeIndex);

  int get currentTheme => _currentlySelectedThemeIndex;

  Future updateTheme(int index) async {
    _currentlySelectedThemeIndex = index;
    await _updateThemeInDb(index);
  }

  Future getThemeFromDb() async {
    final preferences = await SharedPreferences.getInstance();
    _currentlySelectedThemeIndex = preferences.getInt("current_theme") ?? 0;
  }

  _updateThemeInDb(int index) async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setInt("current_theme", index);
  }
}

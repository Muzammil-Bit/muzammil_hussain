import 'package:shared_preferences/shared_preferences.dart';

enum ThemeColor {
  purple,
  orange,
  blue,
  yellow,
  green,
}

class ThemeRepo {
  ThemeColor _theme;

  ThemeRepo(this._theme);

  ThemeColor get currentTheme => _theme;

  updateTheme(ThemeColor theme) async {
    _theme = theme;
    _updateThemeInDb(theme);
  }

  static Future<ThemeColor> getThemeFromDb(ThemeColor theme) async {
    final preferences = await SharedPreferences.getInstance();
    final color = await preferences.getString("current_theme");

    return _themeColorFromString(color);
  }

  _updateThemeInDb(ThemeColor theme) async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setString("current_theme", theme.toString());
  }

  static ThemeColor _themeColorFromString(String? color) {
    switch (color) {
      case "blue":
        return ThemeColor.blue;
      case "green":
        return ThemeColor.green;
      case "orange":
        return ThemeColor.orange;
      case "purple":
        return ThemeColor.purple;
      case "yellow":
        return ThemeColor.yellow;
      default:
        throw Exception("Unimplemented theme");
    }
  }
}

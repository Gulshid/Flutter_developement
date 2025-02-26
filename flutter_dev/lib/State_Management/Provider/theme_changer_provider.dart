import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Theme_Changer with ChangeNotifier {
  var _theme_mode = ThemeMode.light;
  ThemeMode get theme_Mode => _theme_mode;

  void set_theme(theme_Mode) {
    _theme_mode = theme_Mode;
    notifyListeners();
  }
}

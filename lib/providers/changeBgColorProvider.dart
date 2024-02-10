import 'package:flutter/material.dart';

class ChangeBgColorProvider with ChangeNotifier {
  bool _isDark = false;

  bool get isDark => _isDark;

  setIsDark(bool value) {
    _isDark = value;
    notifyListeners();
  }

  changeBgColor() {
    _isDark = !isDark;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeBgColorProvider with ChangeNotifier {
  bool _isDark = false;

  bool get isDark => _isDark;

  setIsDark(bool value) {
    _isDark = value;
    notifyListeners();
  }

  changeBgColor() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDark = !isDark;
    await prefs.setBool('isDark', _isDark);
    notifyListeners();
  }
}

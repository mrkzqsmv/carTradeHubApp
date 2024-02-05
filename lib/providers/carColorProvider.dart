import 'package:flutter/material.dart';

class CarColorProvider with ChangeNotifier {
  String _selectedColor = 'Red';

  String get selectedColor => _selectedColor;

  void updateSelectedColor(String? newColor) {
    _selectedColor = newColor!;
    notifyListeners();
  }
}

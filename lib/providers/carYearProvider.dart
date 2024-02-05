import 'package:flutter/material.dart'; 

class CarYearProvider with ChangeNotifier {
  int _selectedYear = 2022;

  int get selectedYear => _selectedYear;

  void updateSelectedColor(int? newYear) {
    _selectedYear = newYear!;
    notifyListeners();
  }
}

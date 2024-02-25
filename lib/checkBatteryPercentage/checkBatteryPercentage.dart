// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:battery_plus/battery_plus.dart';
import 'package:flutter/material.dart';

class CheckBatteryPercentageProvider with ChangeNotifier {
  Future<dynamic> checkBattery(BuildContext context) async {
    var battery = Battery();
    if (await battery.batteryLevel < 29) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill the battery'),
          backgroundColor: Colors.green,
          padding: EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 20,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Your phone battery is good'),
          backgroundColor: Colors.red,
          padding: EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 20,
          ),
        ),
      );
    }
    notifyListeners();
  }
}

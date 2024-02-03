import 'package:car_trade_hub_app/constants/constantColors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConstantStyles {
  //Splash screen
  //App name style in splash screen
  static TextStyle appNameStyle = GoogleFonts.agdasima(
      color: ConstantColors.mainColor, fontSize: 40, fontWeight: FontWeight.bold);
  //Title style in splash screen
  static TextStyle titleStyle = GoogleFonts.agdasima(
      color: ConstantColors.mainColor, fontSize: 40, fontWeight: FontWeight.bold);
  //Subtitle style in splash screen
  static TextStyle subTitleStyle = GoogleFonts.agdasima(
      color: ConstantColors.mainColor, fontSize: 30, fontWeight: FontWeight.bold);
  //Title in next button in splash screen
  static TextStyle btnTitleStyle = GoogleFonts.agdasima(
      color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold);

  //Login
  //hint text style in login screen
  static TextStyle hintTextStyle = GoogleFonts.agdasima(
      color: ConstantColors.mainColor, fontSize: 20, fontWeight: FontWeight.bold);
}

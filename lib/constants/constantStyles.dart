import 'package:car_trade_hub_app/constants/constantColors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConstantStyles {
  //Splash screen
  //App name style in splash screen
  static TextStyle appNameStyle = GoogleFonts.agdasima(
      color: ConstantColors.mainColor,
      fontSize: 40,
      fontWeight: FontWeight.bold);
  //Title style in splash screen
  static TextStyle titleStyle = GoogleFonts.agdasima(
      color: ConstantColors.mainColor,
      fontSize: 40,
      fontWeight: FontWeight.bold);
  //Subtitle style in splash screen
  static TextStyle subTitleStyle = GoogleFonts.agdasima(
      color: ConstantColors.mainColor,
      fontSize: 30,
      fontWeight: FontWeight.bold);
  //Title in next button in splash screen
  static TextStyle btnTitleStyle = GoogleFonts.agdasima(
      color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold);

  //Login
  //hint text style in login screen
  static TextStyle hintTextStyle = GoogleFonts.agdasima(
      color: ConstantColors.mainColor,
      fontSize: 20,
      fontWeight: FontWeight.bold);

  //Main
  //appBarTitleStyle in main screen
  static TextStyle appBarTitleStyle = GoogleFonts.agdasima(
      color: ConstantColors.mainColor,
      fontSize: 30,
      fontWeight: FontWeight.bold);

  //appBar action button  style in main screen
  static TextStyle appBarActionBtnStyle = GoogleFonts.agdasima(
      color: ConstantColors.mainColor,
      fontSize: 25,
      fontWeight: FontWeight.bold);

  //Image text style in new anounce screen
  static TextStyle imageTextStyle = GoogleFonts.agdasima(
      color: ConstantColors.mainColor,
      fontSize: 20,
      fontWeight: FontWeight.bold);

  //Expansion tile title style in more screen
  static TextStyle tileStyle = GoogleFonts.agdasima(
      color: ConstantColors.greyColor,
      fontSize: 20,
      fontWeight: FontWeight.bold);

  //Title style in favourite screen
  static TextStyle titleTextStyle = GoogleFonts.agdasima(
      color: ConstantColors.mainColor,
      fontSize: 25,
      fontWeight: FontWeight.bold);

  //Text style in favourite screen
  static TextStyle favouriteTextStyle = GoogleFonts.agdasima(
      color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold);

  //Search bar hint style in main and favourite screens
  static TextStyle searchBarHintStyle = GoogleFonts.agdasima(
      color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold);
}

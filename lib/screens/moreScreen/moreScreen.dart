import 'package:car_trade_hub_app/constants/constantColors.dart';
import 'package:car_trade_hub_app/constants/constantStyles.dart';
import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ConstantColors.generalBgColor,
          elevation: 0,
          title: Text(
            'Daha çox',
            style: ConstantStyles.appBarTitleStyle,
          ),
          centerTitle: true,
        ),
      ),
    );
  }
}

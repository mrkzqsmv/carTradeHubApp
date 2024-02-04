import 'package:car_trade_hub_app/constants/constantStyles.dart';
import 'package:flutter/material.dart';
import '../../constants/constantColors.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ConstantColors.generalBgColor,
          elevation: 0,
          title: Text(
            'Car Trade App',
            style: ConstantStyles.appBarTitleStyle,
          ),
          actions: [
            TextButton(
              onPressed: () {},
              child: Text(
                'Cities',
                style: ConstantStyles.appBarActionBtnStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:car_trade_hub_app/constants/constantStyles.dart';
import 'package:flutter/material.dart';

class SplashScreenSubtitleWidget extends StatelessWidget {
  final String subtitle;
  const SplashScreenSubtitleWidget({super.key, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      style: ConstantStyles.subTitleStyle,
      textAlign: TextAlign.center,
    );
  }
}

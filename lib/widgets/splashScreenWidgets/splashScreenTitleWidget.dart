import 'package:flutter/material.dart';
import '../../constants/constantStyles.dart';

class SplashScreenTitleWidget extends StatelessWidget {
  final String title;
  const SplashScreenTitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: ConstantStyles.titleStyle,
    );
  }
}

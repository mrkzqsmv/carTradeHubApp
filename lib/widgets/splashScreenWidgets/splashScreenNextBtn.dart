import 'package:car_trade_hub_app/constants/constantStyles.dart';
import 'package:flutter/material.dart';

class SplashScreenNextBtn extends StatelessWidget {
  final String btnText;
  final Function btnFunc;
  const SplashScreenNextBtn(
      {super.key, required this.btnText, required this.btnFunc});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => btnFunc(),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            btnText,
            style: ConstantStyles.btnTitleStyle,
          ),
        ),
      ),
    );
  }
}

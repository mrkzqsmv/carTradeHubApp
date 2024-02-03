import 'package:car_trade_hub_app/screens/splashScreens/thirdSplashScreen.dart';
import 'package:flutter/material.dart';

import '../../widgets/splashScreenWidgets/splashScreenCarWidget.dart';
import '../../widgets/splashScreenWidgets/splashScreenNextBtn.dart';
import '../../widgets/splashScreenWidgets/splashScreenSubtitleWidget.dart';
import '../../widgets/splashScreenWidgets/splashScreenTitleWidget.dart';

class SecondSplashScreen extends StatelessWidget {
  const SecondSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SplashScreenCarWidget(path: 'assets/svg/secondCarSvg.svg'),
              const SizedBox(height: 10),
              const SplashScreenTitleWidget(
                  title: 'Effortless Selling Process!'),
              const SizedBox(height: 10),
              const SplashScreenSubtitleWidget(
                  subtitle:
                      'Sell your car quickly and reliably, get the price you want.'),
              const SizedBox(height: 10),
              SplashScreenNextBtn(
                  btnText: 'Next',
                  btnFunc: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ThirdSplashScreen(),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}

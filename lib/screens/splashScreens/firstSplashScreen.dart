import 'package:flutter/material.dart';
import '../../widgets/splashScreenWidgets/splashScreenCarWidget.dart';
import '../../widgets/splashScreenWidgets/splashScreenNextBtn.dart';
import '../../widgets/splashScreenWidgets/splashScreenSubtitleWidget.dart';
import '../../widgets/splashScreenWidgets/splashScreenTitleWidget.dart';
import 'secondSplashScreen.dart';

class FirstSplashScreen extends StatefulWidget {
  const FirstSplashScreen({super.key});

  @override
  State<FirstSplashScreen> createState() => _FirstSplashScreenState();
}

class _FirstSplashScreenState extends State<FirstSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SplashScreenCarWidget(path: 'assets/svg/welcomeSvg.svg'),
              const SizedBox(height: 10),
              const SplashScreenTitleWidget(title: 'Welcome!'),
              const SizedBox(height: 10),
              const SplashScreenSubtitleWidget(
                  subtitle:
                      'You are in the right place to sell your car or buy a new one.'),
              const SizedBox(height: 10),
              SplashScreenNextBtn(
                  btnText: 'Next',
                  btnFunc: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const SecondSplashScreen(),
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

import 'dart:async';
import 'package:car_trade_hub_app/widgets/splashScreenWidgets/splashScreenAnimationWidget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../constants/constantStyles.dart';
import '../../widgets/splashScreenWidgets/splashScreenCarWidget.dart';
import 'firstSplashScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (_) => const FirstSplashScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SplashScreenAnimationScreen(
                  animationPath:
                      'assets/animations/splashScreenCarLottie.json'),
              Text(
                'Car Trade Hub App',
                style: ConstantStyles.appNameStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

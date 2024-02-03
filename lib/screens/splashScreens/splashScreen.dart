import 'dart:async';
import 'package:flutter/material.dart';
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SplashScreenCarWidget(path: 'assets/svg/firstCarSvg.svg'),
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

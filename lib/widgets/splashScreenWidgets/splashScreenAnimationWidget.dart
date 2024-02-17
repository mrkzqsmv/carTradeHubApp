import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreenAnimationScreen extends StatelessWidget {
  final String animationPath;
  const SplashScreenAnimationScreen({super.key, required this.animationPath});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(50),
      color: Colors.red,
      child: Lottie.asset(animationPath),
    );
  }
}

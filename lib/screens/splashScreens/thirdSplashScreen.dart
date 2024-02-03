import 'package:car_trade_hub_app/screens/registerScreens/registerScreen.dart';
import 'package:flutter/material.dart';
import '../../widgets/splashScreenWidgets/splashScreenCarWidget.dart';
import '../../widgets/splashScreenWidgets/splashScreenNextBtn.dart';
import '../../widgets/splashScreenWidgets/splashScreenSubtitleWidget.dart';
import '../../widgets/splashScreenWidgets/splashScreenTitleWidget.dart';
import '../loginScreens/loginScreen.dart';

class ThirdSplashScreen extends StatelessWidget {
  const ThirdSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SplashScreenCarWidget(path: 'assets/svg/busSvg.svg'),
              const SizedBox(height: 10),
              const SplashScreenTitleWidget(
                  title: 'Reach Your Goal with Ease!'),
              const SizedBox(height: 10),
              const SplashScreenSubtitleWidget(
                  subtitle:
                      'Find the car of your dreams, make transactions with reasonable prices and trustworthy sellers.'),
              const SizedBox(height: 10),
              SplashScreenNextBtn(
                  btnText: 'Login',
                  btnFunc: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const LoginScreen(),
                      ),
                    );
                  }),
              const SizedBox(height: 10),
              SplashScreenNextBtn(
                  btnText: 'Register',
                  btnFunc: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const RegisterScreen(),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

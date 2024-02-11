import 'package:car_trade_hub_app/constants/constantColors.dart';
import 'package:car_trade_hub_app/constants/constantStyles.dart';
import 'package:car_trade_hub_app/widgets/splashScreenWidgets/splashScreenCarWidget.dart';
import 'package:car_trade_hub_app/widgets/splashScreenWidgets/splashScreenNextBtn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerifyYourEmailScreen extends StatelessWidget {
  final String text;
  final bool isBack;
  const VerifyYourEmailScreen(
      {super.key, required this.text, required this.isBack});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: isBack == true
            ? AppBar(
                leading: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: ConstantColors.mainColor,
                    )))
            : AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SplashScreenCarWidget(
                  path: 'assets/svg/verifyAccountSvg.svg'),
              const SizedBox(height: 10),
              Text(
                text,
                textAlign: TextAlign.center,
                style: ConstantStyles.appBarTitleStyle,
              ),
              const SizedBox(height: 10),
              SplashScreenNextBtn(
                  btnText: 'Click button for get a code',
                  btnFunc: () {
                    FirebaseAuth.instance.currentUser!
                        .sendEmailVerification()
                        .then((value) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.green,
                          content: Text('We sent you verification code'),
                        ),
                      );
                    }).catchError((err) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('PLEASE TRY AGAIN '),
                        ),
                      );
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }
}

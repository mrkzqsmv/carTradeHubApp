import 'package:car_trade_hub_app/widgets/loginScreenWidgets/textFormFieldWidget.dart';
import 'package:car_trade_hub_app/widgets/splashScreenWidgets/splashScreenCarWidget.dart';
import 'package:car_trade_hub_app/widgets/splashScreenWidgets/splashScreenNextBtn.dart';
import 'package:car_trade_hub_app/widgets/splashScreenWidgets/splashScreenTitleWidget.dart';
import 'package:flutter/material.dart';
import '../../constants/constantColors.dart';
import '../registerScreens/registerScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //textFormField controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  //formKey
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(
            color: Colors.red,
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SplashScreenCarWidget(path: 'assets/svg/sportCarSvg.svg'),
              const SplashScreenTitleWidget(title: 'Login'),
              const SizedBox(height: 10),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormFieldWidget(
                      controller: emailController,
                      hintText: 'Type email...',
                      isPassword: false,
                    ),
                    const SizedBox(height: 10),
                    TextFormFieldWidget(
                      controller: passwordController,
                      hintText: 'Type password...',
                      isPassword: true,
                    ),
                    const SizedBox(height: 10),
                    SplashScreenNextBtn(btnText: 'Login', btnFunc: () {}),
                    const SizedBox(
                      height: 30,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const RegisterScreen()));
                        },
                        child: const Text(
                          'Don\'t have an account ? Go to Register screen.',
                          style: TextStyle(
                              color: ConstantColors.mainColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../constants/constantColors.dart';
import '../../widgets/loginScreenWidgets/textFormFieldWidget.dart';
import '../../widgets/splashScreenWidgets/splashScreenCarWidget.dart';
import '../../widgets/splashScreenWidgets/splashScreenNextBtn.dart';
import '../../widgets/splashScreenWidgets/splashScreenTitleWidget.dart';
import '../loginScreens/loginScreen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
              const SplashScreenCarWidget(path: 'assets/svg/bikeSvg.svg'),
              const SplashScreenTitleWidget(title: 'Register'),
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
                    SplashScreenNextBtn(btnText: 'Register', btnFunc: () {}),
                    const SizedBox(
                      height: 30,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const LoginScreen()));
                        },
                        child: const Text(
                          'Already have an account ? Go to login screen.',
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

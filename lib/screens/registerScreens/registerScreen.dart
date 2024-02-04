// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../constants/constantColors.dart';
import '../../widgets/loginScreenWidgets/textFormFieldWidget.dart';
import '../../widgets/splashScreenWidgets/splashScreenCarWidget.dart';
import '../../widgets/splashScreenWidgets/splashScreenNextBtn.dart';
import '../../widgets/splashScreenWidgets/splashScreenTitleWidget.dart';
import '../homeScreen.dart';
import '../loginScreens/loginScreen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  //textFormField controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  //formKey
  final _formKey = GlobalKey<FormState>();
  //auth reference
  FirebaseAuth auth = FirebaseAuth.instance;
  //firestore reference
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  void dispose() {
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> register(String email, String username, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      String userID = userCredential.user!.uid;

      await users.doc(userID).set({
        'email': email,
        'username': username,
        'password': password,
      });
    } catch (e) {
      debugPrint('ERROR $e');
    }
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
          child: SingleChildScrollView(
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
                        controller: usernameController,
                        hintText: 'Type username...',
                        isPassword: false,
                      ),
                      const SizedBox(height: 10),
                      TextFormFieldWidget(
                        controller: passwordController,
                        hintText: 'Type password...',
                        isPassword: true,
                      ),
                      const SizedBox(height: 10),
                      SplashScreenNextBtn(
                          btnText: 'Register',
                          btnFunc: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              register(
                                      emailController.text,
                                      usernameController.text,
                                      passwordController.text)
                                  .then((value) {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const HomeScreen(),
                                    ),
                                    (route) => false);
                              });
                            }
                          }),
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
      ),
    );
  }
}

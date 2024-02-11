import 'package:car_trade_hub_app/constants/constantColors.dart';
import 'package:car_trade_hub_app/constants/constantStyles.dart';
import 'package:car_trade_hub_app/providers/changeBgColorProvider.dart';
import 'package:car_trade_hub_app/screens/homeScreen.dart';
import 'package:car_trade_hub_app/verifyYourEmailScreen/verifyYourEmailScreen.dart';
import 'package:car_trade_hub_app/widgets/loginScreenWidgets/textFormFieldWidget.dart';
import 'package:car_trade_hub_app/widgets/splashScreenWidgets/splashScreenNextBtn.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CompleteProfile extends StatefulWidget {
  const CompleteProfile({super.key});

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController socialMediaLinkController =
      TextEditingController();
  //Age

  FirebaseAuth auth = FirebaseAuth.instance;

  String userID = FirebaseAuth.instance.currentUser!.uid;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    fullNameController.dispose();
    locationController.dispose();
    phoneNumberController.dispose();
    socialMediaLinkController.dispose();
    super.dispose();
  }

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Widget build(BuildContext context) {
    return auth.currentUser!.emailVerified
        ? SafeArea(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: ConstantColors.generalBgColor,
                iconTheme: const IconThemeData(color: ConstantColors.mainColor),
                title: Text(
                  'Complete your profile',
                  style: ConstantStyles.appBarTitleStyle,
                ),
                centerTitle: true,
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            TextFormFieldWidget(
                                controller: fullNameController,
                                hintText: 'Type your fullname...',
                                isPassword: false),
                            const SizedBox(height: 10),
                            TextFormFieldWidget(
                                controller: locationController,
                                hintText: 'Type location...',
                                isPassword: false),
                            const SizedBox(height: 10),
                            TextFormFieldWidget(
                                controller: phoneNumberController,
                                hintText: 'Type phone number...',
                                isPassword: false),
                            const SizedBox(height: 10),
                            Container(
                              width: double.infinity,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Provider.of<ChangeBgColorProvider>(
                                                    context)
                                                .isDark
                                            ? ConstantColors.generalBgColor
                                            : ConstantColors.whiteBgColor,
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          color: ConstantColors.greyColor),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  onPressed: () {
                                    _selectDate(context);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20),
                                    child: Text(
                                      selectedDate.toString(),
                                      style: const TextStyle(
                                          color: ConstantColors.mainColor),
                                    ),
                                  )),
                            ),
                            const SizedBox(height: 10),
                            TextFormFieldWidget(
                                controller: socialMediaLinkController,
                                hintText:
                                    'Type any social media link...(optional)',
                                isPassword: false),
                            const SizedBox(height: 10),
                            SplashScreenNextBtn(
                                btnText: 'Complete profile',
                                btnFunc: () {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    completeProfile(userID);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                const HomeScreen()));
                                  }
                                })
                          ],
                        ))
                  ],
                ),
              ),
            ),
          )
        : const VerifyYourEmailScreen(
            text:
                'If you want to complete your profile, please verify your email address once.',
            isBack: true,
          );
  }

  Future<void> completeProfile(
    String userID,
  ) async {
    try {
      await users
          .doc(userID)
          .update({
            'fullName': fullNameController.text,
            'location': locationController.text,
            'phoneNumber': phoneNumberController.text,
            'socialMediaLink': socialMediaLinkController.text,
            'birthday': selectedDate
          })
          .then((value) => debugPrint('ADDED SUCCESS'))
          .catchError((err) => debugPrint('FAILED ADDED'));
    } catch (e) {
      debugPrint('FAILED COMPLETED PROFILE $e');
    }
  }
}

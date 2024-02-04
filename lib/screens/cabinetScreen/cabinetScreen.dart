// ignore_for_file: use_build_context_synchronously
import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:svg_flutter/svg_flutter.dart';
import '../../constants/constantColors.dart';
import '../../constants/constantStyles.dart';
import '../../widgets/splashScreenWidgets/splashScreenNextBtn.dart';
import '../loginScreens/loginScreen.dart';
import '../registerScreens/registerScreen.dart';

class CabinetScreen extends StatefulWidget {
  const CabinetScreen({super.key});

  @override
  State<CabinetScreen> createState() => _CabinetScreenState();
}

class _CabinetScreenState extends State<CabinetScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  File? _selectedImg;

  String? profileImageBase64;

  @override
  void initState() {
    super.initState();
    getUserProfileData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ConstantColors.generalBgColor,
          elevation: 0,
          title: Text(
            'My Cabinet',
            style: ConstantStyles.appBarTitleStyle,
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 40),
              GestureDetector(
                onTap: () {
                  _pickImgFromGalleryAndUploadFirestore();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.height / 6.5,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: profileImageBase64 != null
                      ? Image.memory(
                        base64Decode(profileImageBase64!),
                        width: 200,
                        height: 200,
                      )
                      : SvgPicture.asset('assets/svg/userSvg.svg'),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                auth.currentUser!.email.toString(),
                style: GoogleFonts.agdasima(
                  color: ConstantColors.mainColor,
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 10),
              SplashScreenNextBtn(
                  btnText: 'Sign Out',
                  btnFunc: () async {
                    try {
                      if (auth.currentUser == null) return;
                      await auth.signOut();
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const LoginScreen()),
                          (route) => false);
                    } catch (e) {
                      debugPrint('FAILED SIGN OUT $e');
                    }
                  }),
              const SizedBox(height: 10),
              SplashScreenNextBtn(
                  btnText: 'Delete My Account',
                  btnFunc: () async {
                    try {
                      if (auth.currentUser == null) return;
                      await auth.currentUser!.delete();
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const RegisterScreen()),
                          (route) => false);
                    } catch (e) {
                      debugPrint('FAILED DELETED ACCOUNT $e');
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickImgFromGalleryAndUploadFirestore() async {
    try {
      final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );

      setState(() {
        _selectedImg = File(pickedFile!.path);
      });

      String userId = auth.currentUser!.uid;

      await uploadImageToFirestore(userId, _selectedImg!);
    } catch (e) {
      debugPrint('ERROR FAILED PICKED IMAGE $e');
    }
  }

  Future<void> uploadImageToFirestore(String userId, File imageFile) async {
    try {
      List<int> imageBytes = await imageFile.readAsBytes();
      String base64Image = base64Encode(imageBytes);

      await firestore.collection('users').doc(userId).update({
        'profileImg': base64Image,
      });

      debugPrint('SUCCESS IMAGE ADDED FIRESTORE.');
    } catch (e) {
      debugPrint('ERROR: $e');
    }
  }

  Future<void> getUserProfileData() async {
    try {
      var docSnapshot =
          await firestore.collection('users').doc(auth.currentUser!.uid).get();

      if (docSnapshot.exists) {
        setState(() {
          profileImageBase64 = docSnapshot.data()?['profileImg'];
        });
      }
    } catch (e) {
      debugPrint('ERROR: $e');
    }
  }
}

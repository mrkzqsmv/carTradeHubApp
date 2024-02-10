import 'dart:convert';
import 'dart:io';

import 'package:car_trade_hub_app/providers/carColorProvider.dart';
import 'package:car_trade_hub_app/providers/carYearProvider.dart';
import 'package:car_trade_hub_app/widgets/anounceScreenWidgets/anounceDropDownColorBtn.dart';
import 'package:car_trade_hub_app/widgets/anounceScreenWidgets/anounceDropDownYearBtn.dart';
import 'package:car_trade_hub_app/widgets/anounceScreenWidgets/anounceSaveInfoBtnWidget.dart';
import 'package:car_trade_hub_app/widgets/anounceScreenWidgets/anounceTextFormFieldWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../constants/constantColors.dart';
import '../../constants/constantStyles.dart';

class NewAnounceScreen extends StatefulWidget {
  const NewAnounceScreen({super.key});

  @override
  State<NewAnounceScreen> createState() => _NewAnounceScreenState();
}

class _NewAnounceScreenState extends State<NewAnounceScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController carNameController = TextEditingController();
  final TextEditingController carBrandController = TextEditingController();
  final TextEditingController carModelController = TextEditingController();
  final TextEditingController carMilageController = TextEditingController();
  final TextEditingController carPriceController = TextEditingController();
  final TextEditingController carLocationController = TextEditingController();
  final TextEditingController yourEmailAddressController =
      TextEditingController();
  final TextEditingController yourPhoneNumberController =
      TextEditingController();
  final TextEditingController carAdditionaInfoController =
      TextEditingController();
  //Car year
  //FuelType
  //Car color

  @override
  void dispose() {
    carNameController.dispose();
    carBrandController.dispose();
    carModelController.dispose();
    carMilageController.dispose();
    carPriceController.dispose();
    carLocationController.dispose();
    carAdditionaInfoController.dispose();
    yourEmailAddressController.dispose();
    yourPhoneNumberController.dispose();
    super.dispose();
  }

  File? _selectedImg;
  String? profileImageBase64;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference allAnounces =
      FirebaseFirestore.instance.collection('allAnounces');

  List<Object> carAnounces = [];

  @override
  Widget build(BuildContext context) {
    final carColorProvider = Provider.of<CarColorProvider>(context);
    final carYearProvider = Provider.of<CarYearProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ConstantColors.generalBgColor,
          elevation: 0,
          title: Text(
            'Create New Anounce',
            style: ConstantStyles.appBarTitleStyle,
          ),
          centerTitle: true,
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: _pickImgFromGallery,
                  child: Container(
                    color: Colors.white,
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 4.5,
                    child: Center(
                      child: _selectedImg != null
                          ? Image.file(
                              _selectedImg!,
                              fit: BoxFit.cover,
                            )
                          : Text(
                              'Click to choose new image for new anounce',
                              style: ConstantStyles.imageTextStyle,
                            ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        AnounceTextFormFieldWidget(
                            hintText: 'Type car name...',
                            controller: carNameController),
                        const SizedBox(height: 10),
                        AnounceTextFormFieldWidget(
                            hintText: 'Type car brand...',
                            controller: carBrandController),
                        const SizedBox(height: 10),
                        AnounceTextFormFieldWidget(
                            hintText: 'Type car model...',
                            controller: carModelController),
                        const SizedBox(height: 10),
                        AnounceTextFormFieldWidget(
                            hintText: 'Type car milage...',
                            controller: carMilageController),
                        const SizedBox(height: 10),
                        AnounceTextFormFieldWidget(
                            hintText: 'Type price ...',
                            controller: carPriceController),
                        const SizedBox(height: 10),
                        const AnounceDropDownBtn(),
                        const SizedBox(height: 10),
                        const AnounceDropDownYearBtn(),
                        const SizedBox(height: 10),
                        AnounceTextFormFieldWidget(
                            hintText: 'Type car location...',
                            controller: carLocationController),
                        const SizedBox(height: 10),
                        AnounceTextFormFieldWidget(
                            hintText: 'Type your email address for contact...',
                            controller: yourEmailAddressController),
                        const SizedBox(height: 10),
                        AnounceTextFormFieldWidget(
                            hintText: 'Type your phone number for contact...',
                            controller: yourPhoneNumberController),
                        const SizedBox(height: 10),
                        AnounceTextFormFieldWidget(
                            hintText: 'Type car additional information...',
                            controller: carAdditionaInfoController),
                        const SizedBox(height: 10),
                        AnounceSaveInfoBtnWidget(
                            btnText: 'Save Anounce Info',
                            btnFunc: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                String userId = auth.currentUser!.uid;
                                uploadNewAnounceToDB(
                                        userId,
                                        _selectedImg!,
                                        carNameController.text,
                                        carBrandController.text,
                                        carModelController.text,
                                        carMilageController.text,
                                        carPriceController.text,
                                        carColorProvider.selectedColor,
                                        carYearProvider.selectedYear,
                                        carLocationController.text,
                                        yourEmailAddressController.text,
                                        yourPhoneNumberController.text,
                                        carAdditionaInfoController.text)
                                    .then((value) {
                                  carNameController.clear();
                                  carBrandController.clear();
                                  carModelController.clear();
                                  carMilageController.clear();
                                  carPriceController.clear();
                                  carLocationController.clear();
                                  yourEmailAddressController.clear();
                                  yourPhoneNumberController.clear();
                                  carAdditionaInfoController.clear();
                                });
                              }
                            }),
                      ],
                    )),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _pickImgFromGallery() async {
    try {
      final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );

      setState(() {
        _selectedImg = File(pickedFile!.path);
      });
    } catch (e) {
      debugPrint('ERROR FAILED PICKED IMAGE $e');
    }
  }

  Future<void> uploadNewAnounceToDB(
    String userId,
    File imageFile,
    String carName,
    String carBrand,
    String carModel,
    String carMilage,
    String carPrice,
    String carColor,
    int carYear,
    String carLoc,
    String emailAddress,
    String phoneNumber,
    String carAdditionalInfo,
  ) async {
    try {
      List<int> imageBytes = await imageFile.readAsBytes();
      String base64Image = base64Encode(imageBytes);

      await allAnounces.doc(userId).set({
        'carImg': base64Image,
        'carName': carName,
        'carBrand': carBrand,
        'carModel': carModel,
        'carMilage': carMilage,
        'carPrice': carPrice,
        'carColor': carColor,
        'carYear': carYear,
        'carLoc': carLoc,
        'emailAddress': emailAddress,
        'phoneNumber': phoneNumber,
        'carAdditionalInfo': carAdditionalInfo,
      });

      debugPrint('SUCCESS CAR ANOUNCE ADDED FIRESTORE.');
    } catch (e) {
      debugPrint('ERROR: $e');
    }
  }
}

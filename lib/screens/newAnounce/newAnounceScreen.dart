import 'package:car_trade_hub_app/widgets/anounceScreenWidgets/anounceDropDownColorBtn.dart';
import 'package:car_trade_hub_app/widgets/anounceScreenWidgets/anounceDropDownYearBtn.dart';
import 'package:car_trade_hub_app/widgets/anounceScreenWidgets/anounceSaveInfoBtnWidget.dart';
import 'package:car_trade_hub_app/widgets/anounceScreenWidgets/anounceTextFormFieldWidget.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
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
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 4.5,
                  child: Center(
                    child: Text(
                      'Click to choose new image for new anounce',
                      style: ConstantStyles.imageTextStyle,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Form(
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
                        controller: yourPhoneNumberController),
                    const SizedBox(height: 10),
                    AnounceTextFormFieldWidget(
                        hintText: 'Type your phone number for contact...',
                        controller: yourEmailAddressController),
                    const SizedBox(height: 10),
                    AnounceTextFormFieldWidget(
                        hintText: 'Type car additional information...',
                        controller: carAdditionaInfoController),
                    const SizedBox(height: 10),
                    AnounceSaveInfoBtnWidget(
                        btnText: 'Save Anounce Info', btnFunc: () {}),
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
}

// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:battery_plus/battery_plus.dart';
import 'package:car_trade_hub_app/checkBatteryPercentage/checkBatteryPercentage.dart';
import 'package:car_trade_hub_app/constants/constantStyles.dart';
import 'package:car_trade_hub_app/widgets/mainScreenWidgets/carImgWIdget.dart';
import 'package:car_trade_hub_app/widgets/mainScreenWidgets/searchBarWidget.dart';
import 'package:car_trade_hub_app/widgets/splashScreenWidgets/splashScreenNextBtn.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/constantColors.dart';
import 'anounceDetail.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController controller = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  //For notifiying user
  late Timer _timer;

  @override
  void dispose() {
    controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      _checkBattery();
    });
  }

  _checkBattery() {
    final batteryProvider =
        Provider.of<CheckBatteryPercentageProvider>(context, listen: false);
    batteryProvider.checkBattery(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ConstantColors.generalBgColor,
          elevation: 0,
          title: Text(
            'Car Trade App',
            style: ConstantStyles.appBarTitleStyle,
          ),
          actions: [
            TextButton(
              onPressed: () {
                showSnackBar();
              },
              child: Text(
                'Filter',
                style: ConstantStyles.appBarActionBtnStyle,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            const SizedBox(height: 10),
            SearchBarWidget(
                hintText: 'Search cars for brands', controller: controller),
            const SizedBox(height: 10),
            Expanded(
              child: StreamBuilder(
                stream: firestore.collection('allAnnounces').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator();
                  }

                  var allAnnounces = snapshot.data!.docs;

                  return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                        childAspectRatio: 1.0,
                      ),
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        var announce = allAnnounces[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => AnnounceDetailScreen(
                                  announce: announce,
                                  userID: announce.id,
                                ),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 2),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: ConstantColors.mainColor,
                                      width: 2,
                                    )),
                                child: Column(
                                  children: [
                                    CarImgWidget(
                                      base64Image: announce.get('carImg'),
                                      heightSize: 10,
                                    ),
                                    Text(
                                      announce.get('carPrice') + ' AZN',
                                    ),
                                    Text(announce.get('carBrand')),
                                    Text(announce.get('carYear').toString()),
                                    Text(announce.get('carMileage') + ' KM'),
                                    Expanded(
                                        child: Text(announce.get('carLoc'))),
                                  ],
                                )),
                          ),
                        );
                      });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showSnackBar() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
              height: MediaQuery.of(context).size.height / 3,
              width: double.infinity,
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  TextButton(
                      onPressed: () {},
                      child: Text('Evvelce ucuz',
                          style: ConstantStyles.textButtonStyle)),
                  TextButton(
                      onPressed: () {},
                      child: Text('Evvelce baha',
                          style: ConstantStyles.textButtonStyle)),
                  const Spacer(),
                  SplashScreenNextBtn(
                      btnText: 'Apply',
                      btnFunc: () {
                        //I will delete here
                        Navigator.of(context).pop();
                      }),
                  const SizedBox(height: 10),
                ],
              ));
        });
  }
}

import 'package:car_trade_hub_app/constants/constantStyles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../constants/constantColors.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

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
              onPressed: () {},
              child: Text(
                'Cities',
                style: ConstantStyles.appBarActionBtnStyle,
              ),
            ),
          ],
        ),
        body: Container(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('allAnounces')
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              }

              var document = snapshot.data;

              var field1 = document!['carBrand'];
              var field2 = document['carModel'];

              return const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [],
              );
            },
          ),
        ),
      ),
    );
  }
}

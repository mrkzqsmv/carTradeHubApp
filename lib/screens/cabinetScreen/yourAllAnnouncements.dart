import 'package:car_trade_hub_app/constants/constantColors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../widgets/mainScreenWidgets/carImgWIdget.dart';
import '../mainScreen/anounceDetail.dart';

class YourAllAnnouncementsScreen extends StatelessWidget {
  const YourAllAnnouncementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ConstantColors.generalBgColor,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: ConstantColors.mainColor,
              )),
        ),
        body: Column(
          children: [
            const SizedBox(height: 10),
            Expanded(
              child: StreamBuilder(
                  stream: firestore
                      .collection('users')
                      .doc(auth.currentUser!.uid)
                      .collection('announcements')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: ConstantColors.mainColor,
                        ),
                      );
                    }

                    var allAnnounces = snapshot.data!.docs;

                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5.0,
                        mainAxisSpacing: 5.0,
                        childAspectRatio: 1.0,
                      ),
                      itemCount: allAnnounces.length,
                      itemBuilder: (BuildContext context, int index) {
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
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

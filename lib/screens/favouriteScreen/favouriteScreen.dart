import 'package:car_trade_hub_app/providers/favouriteAnounceProvider.dart';
import 'package:car_trade_hub_app/widgets/mainScreenWidgets/carImgWIdget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/constantColors.dart';
import '../../constants/constantStyles.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ConstantColors.generalBgColor,
          elevation: 0,
          title: Text(
            'Favourite',
            style: ConstantStyles.appBarTitleStyle,
          ),
          centerTitle: true,
        ),
        body: StreamBuilder(
          stream: firestore.collection('favourites').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            if (snapshot.hasError) {
              return Text('ERROR SNAPSHOT ${snapshot.error}');
            }

            final favouritesDocs = snapshot.data!.docs;
            return ListView.builder(
              itemCount: favouritesDocs.length,
              itemBuilder: (context, index) {
                final favourite = favouritesDocs[index];
                final userId = favourite['userId'];
                final anounceId = favourite['anounceId'];
                return FutureBuilder(
                    future:
                        firestore.collection('allAnounces').doc(userId).get(),
                    builder: (context,
                        AsyncSnapshot<DocumentSnapshot> anounceSnapshot) {
                      if (anounceSnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      }
                      if (anounceSnapshot.hasError) {
                        return Text(
                            'Bir hata oluştu: ${anounceSnapshot.error}');
                      }

                      final anounceData = anounceSnapshot.data!;

                      return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(color: ConstantColors.mainColor)),
                        child: Row(
                          children: [
                            const SizedBox(width: 15),
                            SizedBox(
                              width: 150,
                              height: 150,
                              child: CarImgWidget(
                                  base64Image: anounceData['carImg'],
                                  heightSize: 4),
                            ),
                            const SizedBox(width: 30),
                            SizedBox(
                              width: 100,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    anounceData['carBrand'],
                                    style: ConstantStyles.titleTextStyle,
                                  ),
                                  Text(
                                    anounceData['carModel'],
                                    style: ConstantStyles.favouriteTextStyle,
                                  ),
                                  Text(
                                    anounceData['carYear'].toString(),
                                    style: ConstantStyles.favouriteTextStyle,
                                  ),
                                  Text(anounceData['carMilage'],
                                      style: ConstantStyles.favouriteTextStyle),
                                  Text(anounceData['carLoc'],
                                      style: ConstantStyles.favouriteTextStyle),
                                  Text(anounceData['carColor'],
                                      style: ConstantStyles.favouriteTextStyle),
                                  Text(anounceData['carPrice'],
                                      style: ConstantStyles.favouriteTextStyle),
                                ],
                              ),
                            ),
                            const SizedBox(width: 30),
                            IconButton(
                                onPressed: () async {
                                  firestore
                                      .collection('favourites')
                                      .doc(userId)
                                      .delete();
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: ConstantColors.mainColor,
                                  size: 25,
                                ))
                          ],
                        ),
                      );
                    });
              },
            );
          },
        ),
      ),
    );
  }
}

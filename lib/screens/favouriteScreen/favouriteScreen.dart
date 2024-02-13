import 'package:car_trade_hub_app/screens/favouriteScreen/favouriteDetailScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/constantColors.dart';
import '../../constants/constantStyles.dart';
import '../../providers/favouriteAnounceProvider.dart';
import '../../widgets/mainScreenWidgets/carImgWIdget.dart';
import '../../widgets/mainScreenWidgets/searchBarWidget.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController favouriteCarController = TextEditingController();

  @override
  void dispose() {
    favouriteCarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavouriteAnnounceProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ConstantColors.generalBgColor,
          elevation: 0,
          title: Text(
            'Favourites',
            style: ConstantStyles.appBarTitleStyle,
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            const SizedBox(height: 10),
            SearchBarWidget(
                hintText: 'Search cars for brands',
                controller: favouriteCarController),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                  childAspectRatio: 1.0,
                ),
                itemCount: provider.favouriteAnounces.length,
                itemBuilder: (BuildContext context, int index) {
                  var currentAnnounce = provider.favouriteAnounces[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => FavouriteDetailScreen(
                              announce: currentAnnounce,
                              userID: auth.currentUser!.uid)));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 2),
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
                                base64Image: currentAnnounce.get('carImg'),
                                heightSize: 10,
                              ),
                              Text(
                                currentAnnounce.get('carPrice') + ' AZN',
                              ),
                              Text(currentAnnounce.get('carBrand')),
                              Text(currentAnnounce.get('carYear').toString()),
                              Text(currentAnnounce.get('carMileage') + ' KM'),
                              Expanded(
                                  child: Text(currentAnnounce.get('carLoc'))),
                            ],
                          )),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_interpolation_to_compose_strings
import 'package:car_trade_hub_app/models/favouriteAnounceModel.dart';
import 'package:car_trade_hub_app/providers/favouriteAnounceProvider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;
import '../../constants/constantColors.dart';
import '../../constants/constantStyles.dart';
import '../../widgets/mainScreenWidgets/carImgWIdget.dart';
import '../../widgets/splashScreenWidgets/splashScreenNextBtn.dart';

class AnounceDetailScreen extends StatefulWidget {
  final QueryDocumentSnapshot anounce;
  final String userID;
  const AnounceDetailScreen({
    Key? key,
    required this.anounce,
    required this.userID,
  }) : super(key: key);

  @override
  State<AnounceDetailScreen> createState() => _AnounceDetailScreenState();
}

class _AnounceDetailScreenState extends State<AnounceDetailScreen> {
  bool isZoomed = false;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ConstantColors.generalBgColor,
          elevation: 0,
          iconTheme: const IconThemeData(color: ConstantColors.mainColor),
          title: Text(
            'Car Detail Screen',
            style: ConstantStyles.appBarTitleStyle,
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () async {
                Provider.of<FavouriteAnounceProvider>(context, listen: false)
                    .addToFavourites(FavouriteAnounce(
                        anounceID: widget.userID, userID: widget.userID));

                await firestore
                    .collection('favourites')
                    .doc(auth.currentUser!.uid)
                    .set({
                  'anounceId': widget.userID,
                  'userId': widget.userID,
                });
              },
              icon: const Icon(Icons.favorite_outline_rounded),
            ),
          ],
        ),
        body: Center(
            child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isZoomed = !isZoomed;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: ConstantColors.mainColor)),
                  child: CarImgWidget(
                    base64Image: widget.anounce.get('carImg'),
                    heightSize: isZoomed ? 2 : 4,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${'Car Price: ' + widget.anounce.get('carPrice')} AZN',
                      style: ConstantStyles.appBarTitleStyle,
                    ),
                    Text(
                      'Car Brand: ' + widget.anounce.get('carBrand'),
                      style: ConstantStyles.appBarTitleStyle,
                    ),
                    Text(
                      'Car Model: ' + widget.anounce.get('carModel'),
                      style: ConstantStyles.appBarTitleStyle,
                    ),
                    Text(
                      'Car Year: ' + widget.anounce.get('carYear').toString(),
                      style: ConstantStyles.appBarTitleStyle,
                    ),
                    Text(
                      'Car Mileage: ' + widget.anounce.get('carMilage') + ' KM',
                      style: ConstantStyles.appBarTitleStyle,
                    ),
                    Text(
                      'Car Color: ' + widget.anounce.get('carColor'),
                      style: ConstantStyles.appBarTitleStyle,
                    ),
                    Text(
                      'Car Location: ' + widget.anounce.get('carLoc'),
                      style: ConstantStyles.appBarTitleStyle,
                    ),
                    Text(
                      'Car Additional Info: ' +
                          widget.anounce.get('carAdditionalInfo'),
                      style: ConstantStyles.appBarTitleStyle,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              SplashScreenNextBtn(
                  btnText: 'Contact to Seller with Email',
                  btnFunc: () async {
                    final Uri emailLaunchUri = Uri(
                      scheme: 'mailto',
                      path: widget.anounce.get('phoneNumber'),
                      query: encodeQueryParameters(<String, String>{
                        'subject': 'Example Subject & Symbols are allowed!',
                      }),
                    );

                    launcher.launchUrl(emailLaunchUri);
                  }),
              const SizedBox(height: 15),
              SplashScreenNextBtn(
                btnText: 'Call Seller',
                btnFunc: () async {
                  final Uri emailLaunchUri = Uri(
                    scheme: 'tel',
                    path: widget.anounce.get('emailAddress'),
                  );

                  launcher.launchUrl(emailLaunchUri);
                },
              ),
              const SizedBox(height: 15),
            ],
          ),
        )),
      ),
    );
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }
}
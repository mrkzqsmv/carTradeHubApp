// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_interpolation_to_compose_strings
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

class FavouriteDetailScreen extends StatefulWidget {
  final QueryDocumentSnapshot announce;
  final String userID;
  const FavouriteDetailScreen({
    Key? key,
    required this.announce,
    required this.userID,
  }) : super(key: key);

  @override
  State<FavouriteDetailScreen> createState() => _FavouriteDetailScreenState();
}

class _FavouriteDetailScreenState extends State<FavouriteDetailScreen> {
  bool isZoomed = false;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  bool isFavourite = false;
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
                setState(() {
                  isFavourite = !isFavourite;
                });

                isFavourite ? addFavourite() : removeFavourite();
              },
              icon: isFavourite
                  ? const Icon(Icons.favorite)
                  : const Icon(Icons.favorite_outline_outlined),
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
                    base64Image: widget.announce.get('carImg'),
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
                      '${'Car Price: ' + widget.announce.get('carPrice')} AZN',
                      style: ConstantStyles.appBarTitleStyle,
                    ),
                    Text(
                      'Car Brand: ' + widget.announce.get('carBrand'),
                      style: ConstantStyles.appBarTitleStyle,
                    ),
                    Text(
                      'Car Model: ' + widget.announce.get('carModel'),
                      style: ConstantStyles.appBarTitleStyle,
                    ),
                    Text(
                      'Car Year: ' + widget.announce.get('carYear').toString(),
                      style: ConstantStyles.appBarTitleStyle,
                    ),
                    Text(
                      'Car Mileage: ' +
                          widget.announce.get('carMileage') +
                          ' KM',
                      style: ConstantStyles.appBarTitleStyle,
                    ),
                    Text(
                      'Car Color: ' + widget.announce.get('carColor'),
                      style: ConstantStyles.appBarTitleStyle,
                    ),
                    Text(
                      'Car Location: ' + widget.announce.get('carLoc'),
                      style: ConstantStyles.appBarTitleStyle,
                    ),
                    Text(
                      'Car Additional Info: ' +
                          widget.announce.get('carAdditionalInfo'),
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
                      scheme: 'email',
                      path: widget.announce.get('emailAddress'),
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
                    path: widget.announce.get('phoneNumber'),
                  );

                  launcher.launchUrl(emailLaunchUri);
                },
              ),
              const SizedBox(height: 15),
              SplashScreenNextBtn(
                btnText: 'DELETE FROM MY FAVOURITES LIST',
                btnFunc: () {
                  try {
                    Provider.of<FavouriteAnnounceProvider>(context,
                            listen: false)
                        .removeFromFavourites(widget.announce.id);

                    Navigator.pop(context);
                  } catch (e) {
                    print(e);
                  }
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

  Future<void> addFavourite() async {
    Provider.of<FavouriteAnnounceProvider>(context, listen: false)
        .addToFavorites(widget.announce);
  }

  Future<void> removeFavourite() async {
    try {} catch (e) {
      debugPrint('ERROR FAILED REMOVE FAVOURITE $e');
    }
  }
}

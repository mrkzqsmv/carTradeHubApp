import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../constants/constantColors.dart';
import '../../constants/constantStyles.dart';
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
          ],
        ),
      ),
    );
  }
}

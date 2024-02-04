import 'package:flutter/material.dart';

import '../../constants/constantColors.dart';
import '../../constants/constantStyles.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      ),
    );
  }
}

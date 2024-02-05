import 'package:car_trade_hub_app/constants/constantColors.dart';
import 'package:car_trade_hub_app/constants/constantStyles.dart';
import 'package:flutter/material.dart';

class ExpansionTileWidget extends StatelessWidget {
  final String title;
  final String tileContent;
  const ExpansionTileWidget(
      {super.key, required this.title, required this.tileContent});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ExpansionTile(
        collapsedShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        childrenPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        collapsedBackgroundColor: ConstantColors.mainColor,
        backgroundColor: Colors.grey,
        title: Text(
          title,
          style: ConstantStyles.tileStyle,
        ),
        children: [
          Text(tileContent),
        ],
      ),
    );
  }
}

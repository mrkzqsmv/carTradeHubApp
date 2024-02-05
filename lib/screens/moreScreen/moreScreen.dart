import 'package:car_trade_hub_app/constants/constantColors.dart';
import 'package:car_trade_hub_app/constants/constantStyles.dart';
import 'package:flutter/material.dart';

import '../../widgets/moreScreenWidgets/expansionTileWidget.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ConstantColors.generalBgColor,
          elevation: 0,
          title: Text(
            'Daha çox',
            style: ConstantStyles.appBarTitleStyle,
          ),
          centerTitle: true,
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              ExpansionTileWidget(
                title: 'İstifadeci razilasmasi',
                tileContent: 'İstifadeci razilasmasi',
              ),
              SizedBox(height: 10),
              ExpansionTileWidget(
                title: 'Mexfilik siyaseti',
                tileContent: 'Mexfilik siyaseti',
              ),
              SizedBox(height: 10),
              ExpansionTileWidget(
                title: 'Qaydalar',
                tileContent: 'Qaydalar',
              ),
              SizedBox(height: 10),
              Text(
                'En cox verilen suallar',
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              ExpansionTileWidget(
                title: 'Elanim niye derc olunmadi ?',
                tileContent: 'Elanim niye derc olunmadi ?',
              ),
              SizedBox(height: 10),
              ExpansionTileWidget(
                title: 'Elana nece duzelis edim ?',
                tileContent: 'Elana nece duzelis edim ?',
              ),
              SizedBox(height: 10),
              ExpansionTileWidget(
                title: 'Elani nece yerlesdirim ?',
                tileContent: 'Elani nece yerlesdirim ?',
              ),
              SizedBox(height: 10),
              ExpansionTileWidget(
                title: 'Elani nece silim ?',
                tileContent: 'Elani nece silim ?',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

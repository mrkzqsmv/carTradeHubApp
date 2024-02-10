import 'package:car_trade_hub_app/constants/constantColors.dart';
import 'package:car_trade_hub_app/constants/constantStyles.dart';
import 'package:car_trade_hub_app/providers/changeBgColorProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/moreScreenWidgets/expansionTileWidget.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  bool value = false;
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              const ExpansionTileWidget(
                title: 'İstifadeci razilasmasi',
                tileContent: 'İstifadeci razilasmasi',
              ),
              const SizedBox(height: 10),
              const ExpansionTileWidget(
                title: 'Mexfilik siyaseti',
                tileContent: 'Mexfilik siyaseti',
              ),
              const SizedBox(height: 10),
              const ExpansionTileWidget(
                title: 'Qaydalar',
                tileContent: 'Qaydalar',
              ),
              const SizedBox(height: 10),
              const Text(
                'En cox verilen suallar',
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const ExpansionTileWidget(
                title: 'Elanim niye derc olunmadi ?',
                tileContent: 'Elanim niye derc olunmadi ?',
              ),
              const SizedBox(height: 10),
              const ExpansionTileWidget(
                title: 'Elana nece duzelis edim ?',
                tileContent: 'Elana nece duzelis edim ?',
              ),
              const SizedBox(height: 10),
              const ExpansionTileWidget(
                title: 'Elani nece yerlesdirim ?',
                tileContent: 'Elani nece yerlesdirim ?',
              ),
              const SizedBox(height: 10),
              const ExpansionTileWidget(
                title: 'Elani nece silim ?',
                tileContent: 'Elanı necə silim ?',
              ),
              const SizedBox(height: 10),
              Consumer<ChangeBgColorProvider>(
                  builder: (context, provider, child) {
                return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: SwitchListTile(
                        title: Text(
                          'Arxa fon rengini deyiş',
                          style: ConstantStyles.tileStyle,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        tileColor: ConstantColors.mainColor,
                        inactiveThumbColor: ConstantColors.generalBgColor,
                        value: provider.isDark,
                        onChanged: (newValue) {
                          value = newValue;
                          provider.setIsDark(value);
                        }));
              }),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

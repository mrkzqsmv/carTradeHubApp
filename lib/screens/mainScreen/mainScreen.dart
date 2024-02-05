import 'package:car_trade_hub_app/constants/constantStyles.dart';
import 'package:car_trade_hub_app/widgets/mainScreenWidgets/carImgWIdget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../constants/constantColors.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ConstantColors.generalBgColor,
          elevation: 0,
          title: Text(
            'Car Trade App',
            style: ConstantStyles.appBarTitleStyle,
          ),
          actions: [
            TextButton(
              onPressed: () {},
              child: Text(
                'Cities',
                style: ConstantStyles.appBarActionBtnStyle,
              ),
            ),
          ],
        ),
        body: Container(
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('allAnounces')
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                }

                var allAnounces = snapshot.data!.docs;

                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    childAspectRatio: 1.0,
                  ),
                  itemCount: allAnounces.length,
                  itemBuilder: (BuildContext context, int index) {
                    var anounce = allAnounces[index];
                    return Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: ConstantColors.mainColor,
                              width: 2,
                            )),
                        child: Column(
                          children: [
                            CarImgWidget(base64Image: anounce.get('carImg')),
                            Text(
                              anounce.get('carPrice') + ' AZN',
                            ),
                            Text(anounce.get('carBrand')),
                            Text(anounce.get('carYear').toString()),
                            Text(anounce.get('carMilage') + ' KM'),
                            Expanded(child: Text(anounce.get('carLoc'))),
                          ],
                        ));
                  },
                );
              }),
        ),
      ),
    );
  }
}


// ListView.builder(
//                   itemCount: allAnounces.length,
//                   itemBuilder: ((context, index) {
//                     var anounce = allAnounces[index];
//                     return Card(
//                         child: Column(
//                       children: [
//                         CarImgWidget(base64Image: anounce.get('carImg')),
//                         Text(anounce.get('carPrice')),
//                         Text(anounce.get('carBrand')),
//                         Text(anounce.get('carYear').toString()),
//                         Text(anounce.get('carMilage')),
//                         Text(anounce.get('carLoc')),
//                       ],
//                     ));
//                   }));
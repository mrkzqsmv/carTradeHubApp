import 'package:car_trade_hub_app/constants/constantColors.dart';
import 'package:flutter/material.dart';
import 'cabinetScreen/cabinetScreen.dart';
import 'favouriteScreen/favouriteScreen.dart';
import 'mainScreen/mainScreen.dart';
import 'moreScreen/moreScreen.dart';
import 'newAnounce/newAnounceScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedTab = 0;

  final List _pages = const [
    MainScreen(),
    FavouriteScreen(),
    NewAnounceScreen(),
    CabinetScreen(),
    MoreScreen(),
  ];

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _pages[_selectedTab],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedTab,
          onTap: (index) => _changeTab(index),
          selectedFontSize: 15,
          selectedIconTheme: const IconThemeData(size: 25),
          selectedItemColor: Colors.red,
          unselectedItemColor: ConstantColors.generalBgColor,
          elevation: 1,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "ƏSAS"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "SEÇİLMİŞLƏR"),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: "YENİ ELAN"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "KABİNET"),
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: "DAHA ÇOX"),
          ],
        ),
      ),
    );
  }
}

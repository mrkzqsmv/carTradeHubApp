import 'package:car_trade_hub_app/firebase_options.dart';
import 'package:car_trade_hub_app/providers/carColorProvider.dart';
import 'package:car_trade_hub_app/providers/carYearProvider.dart';
import 'package:car_trade_hub_app/providers/changeBgColorProvider.dart';
import 'package:car_trade_hub_app/providers/favouriteAnounceProvider.dart';
import 'package:car_trade_hub_app/widgets/successScreenWidgets/successWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constants/constantColors.dart';
import 'screens/splashScreens/splashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseAuth.instance.idTokenChanges().listen((User? user) {
    if (user == null) {
      debugPrint('User is currently signed out!');
    } else {
      debugPrint('User is signed in!');
    }
  });
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => CarColorProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => CarYearProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => FavouriteAnnounceProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => ChangeBgColorProvider(),
      ),
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ChangeBgColorProvider>(builder: (context, provider, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: provider.isDark
              ? ConstantColors.generalBgColor
              : ConstantColors.whiteBgColor,
        ),
        home: const SuccessWidget(),
      );
    });
  }
}

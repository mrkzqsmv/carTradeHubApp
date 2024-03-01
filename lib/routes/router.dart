import 'package:car_trade_hub_app/screens/splashScreens/firstSplashScreen.dart';
import 'package:car_trade_hub_app/screens/splashScreens/secondSplashScreen.dart';
import 'package:car_trade_hub_app/screens/splashScreens/splashScreen.dart';
import 'package:car_trade_hub_app/screens/splashScreens/thirdSplashScreen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
    GoRoute(
        path: 'splash1',
        builder: (context, state) => const FirstSplashScreen()),
    GoRoute(
        path: 'splash2',
        builder: (context, state) => const SecondSplashScreen()),
    GoRoute(
        path: 'splash3',
        builder: (context, state) => const ThirdSplashScreen()),
    GoRoute(
        path: 'login', builder: (context, state) => const ThirdSplashScreen()),
    GoRoute(
        path: 'register',
        builder: (context, state) => const ThirdSplashScreen()),
  ],
);

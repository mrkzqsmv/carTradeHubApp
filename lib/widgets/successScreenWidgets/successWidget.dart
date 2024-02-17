import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SuccessWidget extends StatelessWidget {
  const SuccessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: TextButton(
            child: Text('Show Modal'),
            onPressed: () {
              
            },
          ),
        ),
      ),
    );
  }
}


//Center(
    //   child: Card(
    //     child: Lottie.asset('assets/animations/successAnimationLottie.json'),
    //   ),
    // );
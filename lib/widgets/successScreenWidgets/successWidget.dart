import 'package:flutter/material.dart';
class SuccessWidget extends StatelessWidget {
  const SuccessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: TextButton(
            child: const Text('Show Modal'),
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
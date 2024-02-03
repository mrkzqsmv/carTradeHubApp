import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class SplashScreenCarWidget extends StatelessWidget {
  final String path;
  const SplashScreenCarWidget({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      width: MediaQuery.of(context).size.width / 2.4,
      colorFilter: const ColorFilter.mode(Colors.red, BlendMode.srcIn),
    );
  }
}

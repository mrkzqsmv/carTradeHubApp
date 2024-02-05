import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

class CarImgWidget extends StatelessWidget {
  final String base64Image;
  const CarImgWidget({super.key, required this.base64Image});

  @override
  Widget build(BuildContext context) {
    List<int> bytes = base64.decode(base64Image);

    return Image.memory(
      Uint8List.fromList(bytes),
      height: MediaQuery.of(context).size.height / 10,
      fit: BoxFit.cover,
    );
  }
}

import 'package:flutter/material.dart';

import '../../constants/constantStyles.dart';

class AnounceTextFormFieldWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const AnounceTextFormFieldWidget(
      {super.key, required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextFormField(
        style: const TextStyle(color: Colors.red),
        controller: controller,
        validator: (value) {
          if (value == null && value!.isEmpty) {
            return 'Please fill the gap';
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: ConstantStyles.hintTextStyle,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

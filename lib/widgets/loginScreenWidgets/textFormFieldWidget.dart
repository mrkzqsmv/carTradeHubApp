// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:car_trade_hub_app/constants/constantStyles.dart';

class TextFormFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;
  const TextFormFieldWidget({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.isPassword,
  }) : super(key: key);

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    bool isObsecure = true;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextFormField(
        style: const TextStyle(color: Colors.red),
        controller: widget.controller,
        obscureText: widget.isPassword ? isObsecure : false,
        validator: (value) {
          if (value == null && value!.isEmpty) {
            return 'Please fill the gap';
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: ConstantStyles.hintTextStyle,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

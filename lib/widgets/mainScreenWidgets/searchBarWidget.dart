import 'package:car_trade_hub_app/constants/constantColors.dart';
import 'package:car_trade_hub_app/constants/constantStyles.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const SearchBarWidget(
      {super.key, required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: ConstantColors.greyColor,
                )),
            hintText: hintText,
            hintStyle: ConstantStyles.hintTextStyle,
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: ConstantColors.mainColor),
              borderRadius: BorderRadius.circular(10),
            )),
      ),
    );
  }
}

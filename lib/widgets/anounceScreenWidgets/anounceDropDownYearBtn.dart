import 'package:flutter/material.dart';

class AnounceDropDownYearBtn extends StatefulWidget {
  const AnounceDropDownYearBtn({super.key});

  @override
  State<AnounceDropDownYearBtn> createState() => _AnounceDropDownYearBtnState();
}

class _AnounceDropDownYearBtnState extends State<AnounceDropDownYearBtn> {
  int selectedYear = 2023;

  List<int> years = List<int>.generate(
      DateTime.now().year - 1500 + 1, (index) => 1500 + index);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: DropdownButtonFormField<int>(
        decoration: const InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        value: selectedYear,
        items: years.map<DropdownMenuItem<int>>((int value) {
          return DropdownMenuItem<int>(
            value: value,
            child: Text(
              value.toString(),
              style: const TextStyle(color: Colors.red),
            ),
          );
        }).toList(),
        onChanged: (int? newValue) {
          setState(() {
            selectedYear = newValue!;
          });
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/carColorProvider.dart';

class AnounceDropDownBtn extends StatefulWidget {
  const AnounceDropDownBtn({super.key});

  @override
  State<AnounceDropDownBtn> createState() => _AnounceDropDownBtnState();
}

class _AnounceDropDownBtnState extends State<AnounceDropDownBtn> {
  String selectedColor = 'Red';

  List<String> colors = [
    'Red',
    'Blue',
    'Green',
    'Yellow',
    'Orange',
    'Purple',
    'Pink',
    'Brown',
    'Grey',
    'Black'
  ];
  @override
  Widget build(BuildContext context) {
    final colorProvider = Provider.of<CarColorProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: DropdownButtonFormField<String>(
        decoration: const InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        value: selectedColor,
        items: colors.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: const TextStyle(color: Colors.red),
            ),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            colorProvider.updateSelectedColor(newValue);
          });
        },
      ),
    );
  }
}

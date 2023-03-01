import 'package:flutter/material.dart';

import 'checkboxState.dart';
import 'group_checkbox.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({Key? key}) : super(key: key);

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  final allNotify = [
    CheckBoxState(title: 'Apartment'),
    CheckBoxState(title: 'House'),
    CheckBoxState(title: 'Plot'),
    CheckBoxState(title: 'Commercial'),
  ];
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: allNotify.length,
        shrinkWrap: true,
        itemBuilder: (context, index) =>
            GroupCheckBox(checkbox: allNotify[index]));
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';
import '../features/search/controllers/search_controller.dart';

class CustomDropDown extends GetView<SearchController> {
  CustomDropDown({
    super.key,
    required this.hintName,
    required this.yourList,
    this.dropdownValue,
    required this.onChanged,
    required this.fontSize,
  });
  final String hintName;
  final List<dynamic> yourList;
  String? dropdownValue;
  Function(dynamic) onChanged;
  double fontSize;
  List<DropdownMenuItem<dynamic>> buildDropdownMenuItems(List list) {
    List<DropdownMenuItem<dynamic>> dropDownItems = [];
    for (var value in list) {
      dropDownItems.add(DropdownMenuItem<dynamic>(
        value: value,
        child: SizedBox(
          width: 200,
          child: Text(
            value,
            style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: fontSize,
                color: Pallete.blackText),
          ),
        ),
      ));
    }

    return dropDownItems;
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      builder: (FormFieldState<String> state) {
        return InputDecorator(
          decoration: InputDecoration(
            hintText: hintName,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<dynamic>(
              hint: SizedBox(
                width: 150,
                child: Text(
                  hintName,
                  style: const TextStyle(color: Pallete.blackText),
                ),
              ),
              value: dropdownValue,
              isDense: true,
              onChanged: onChanged,
              items: buildDropdownMenuItems(yourList),
            ),
          ),
        );
      },
    );
  }
}

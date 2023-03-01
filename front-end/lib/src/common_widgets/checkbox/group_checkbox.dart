import 'package:flutter/material.dart';

import 'checkboxState.dart';

class GroupCheckBox extends StatefulWidget {
  const GroupCheckBox({super.key, required this.checkbox});
  final CheckBoxState checkbox;

  @override
  State<GroupCheckBox> createState() => _GroupCheckBoxState();
}

class _GroupCheckBoxState extends State<GroupCheckBox> {
  final notify = [
    CheckBoxState(title: 'Shophouse'),
    CheckBoxState(title: 'Studio'),
    CheckBoxState(title: 'Top Floor Apartment'),
    CheckBoxState(title: 'Ground Floor Apartment'),
    CheckBoxState(title: 'Penthouse'),
    CheckBoxState(title: 'Officetel'),
    CheckBoxState(title: 'Middle Floor Apartment'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Colors.black.withOpacity(0.1)))),
      child: ExpansionTile(
        title: Text(
          widget.checkbox.title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        leading: Checkbox(
            value: widget.checkbox.value, onChanged: toggleGroupChatBox),
        childrenPadding: const EdgeInsets.only(left: 60),
        children: [
          Wrap(
            children: [...notify.map(singleCheckBox).toList()],
          )
        ],
      ),
    );
  }

  void toggleGroupChatBox(bool? value) {
    if (value == null) return;
    setState(() {
      widget.checkbox.value = value;
      for (var e in notify) {
        e.value = value;
      }
    });
  }

  Widget singleCheckBox(CheckBoxState checkbox) => SizedBox(
        width: 150,
        child: CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: Colors.red,
            title: Text(
              checkbox.title,
              style: const TextStyle(fontSize: 16),
            ),
            value: checkbox.value,
            onChanged: (value) => setState(() {
                  checkbox.value = value!;
                  widget.checkbox.value = notify.every((e) => e.value);
                })),
      );
}

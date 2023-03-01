import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common_widgets/dash_line.dart';
import '../../../constants/constants.dart';
import '../../auth/controllers/login_controller.dart';

class OwnerSearch extends GetView<LoginController> {
  const OwnerSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      decoration: BoxDecoration(
        color: Pallete.appBar,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(children: [
        Row(
          children: const [
            Text(
              'Own Properties Only',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        ),
        Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: const Text(
                      'Owner',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ])),
        CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          activeColor: Colors.black,
          title: const Text(
            'Full Search',
            style: TextStyle(fontSize: 16),
          ),
          value: false,
          onChanged: (value) {},
        ),
        const SizedBox(
          height: 20,
        ),
        const DashLineView(
          fillRate: 0.7,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(color: Colors.black.withOpacity(0.5)),
                  left: BorderSide(color: Colors.black.withOpacity(0.5)),
                  right: BorderSide(color: Colors.black.withOpacity(0.5)))),
          margin: const EdgeInsets.only(top: 20),
          child: Column(
              /* children: [
              fieldBtn(context, 'Listed By', () => Get.toNamed(Routes.type),
                  Icons.keyboard_arrow_right_outlined),
              fieldBtn(
                  context, 'Status', () => Get.toNamed(Routes.type), Icons.menu)
            ]*/
              ),
        ),
        CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          activeColor: Colors.black,
          title: const Text(
            'Shared for Sale',
            style: TextStyle(fontSize: 16),
          ),
          value: true,
          onChanged: (value) {},
        ),
        CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          activeColor: Colors.black,
          title: const Text(
            'Not Shared for Sale',
            style: TextStyle(fontSize: 16),
          ),
          value: true,
          onChanged: (value) {},
        ),
      ]),
    );
  }
}

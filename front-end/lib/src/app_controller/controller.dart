import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Api/api_service.dart';
import '../common_widgets/custom_dropdown.dart';
import '../constants/controllers.dart';

import '../network.dart';
import '../routing/routes.dart';

class AppController extends GetxController {
  static AppController instance = Get.find();
  DateTime now =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  RxString? token;
  Future showDialogs(context, String hintName, List<dynamic> list, String title,
      String? dropdownValue, Function(dynamic) onChanged) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            Row(children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )
            ]),
            const SizedBox(
              height: 10,
            ),
            CustomDropDown(
              hintName: hintName,
              yourList: list,
              dropdownValue: dropdownValue,
              onChanged: onChanged,
              fontSize: 18,
            ),
            const SizedBox(
              height: 10,
            ),
          ]);
        }));
      },
    );
  }

  onSubscriptionConnectivity() {
    networkStream.listen((event) {
      if (event == ConnectivityResult.none) {
        Future.delayed(const Duration(seconds: 10 ), () {
           Get.snackbar('Network', "Check your network");
          });
      }
    });
    checkInternetConnection();
  }

  //login
  String? validateUsername(String? text) {
    if (text == null || text.isEmpty) {
      return emptyMessage();
    }

    return null;
  }

  String? emptyMessage() {
    return 'Field is required';
  }

  String? validateLPassword(String? text) {
    if (text == null || text.isEmpty) {
      return emptyMessage();
    }

    return null;
  }

  //register
  String? validateRUserName(String? text) {
    if (text == null || text.isEmpty) {
      return emptyMessage();
    }
    if (text.length <= 4) {
      return 'Username must have more than 5 characters';
    }
    return null;
  }

  String? validateName(String? text) {
    if (text == null || text.isEmpty) {
      return emptyMessage();
    }
    if (text.length <= 3) {
      return 'Enter your name';
    }
    return null;
  }

  String? validateEmail(String? text) {
    if (text == null || text.isEmpty) {
      return emptyMessage();
    }
    String pattern = r'\w+@\w+\.\w+';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(text)) {
      return 'Invalid Email';
    }
    return null;
  }

  String? validateRPassword(String? text) {
    if (text == null || text.isEmpty) {
      return emptyMessage();
    }

    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z)(?=.*?[0-9)(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(text)) {
      return 'Password must be at least 8 characters\nInclude an uppercase letter, number and symbol';
    }

    return null;
  }

  String? validateConfirmedPassword(String? text) {
    if (text == null || text.isEmpty) {
      return emptyMessage();
    }
    if (text != registerController.passwordController.text) {
      return 'password does not match!';
    }
    return null;
  }

  logout() async {
    await ApiHandler.deleteToken();
    var token = await ApiHandler.getToken();
    if (token == null) {
      await Get.offAllNamed(AppRoutes.auth);
    }
  }
}

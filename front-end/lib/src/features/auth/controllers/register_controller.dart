import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Api/api_service.dart';
import '../../../constants/controllers.dart';
import '../../../routing/routes.dart';
import '../models/agency_model.dart';
import '../services/auth_service.dart';

class RegisterController extends GetxController {
  var isLoading = false.obs;
  final registerFormKey = GlobalKey<FormState>();
  late TextEditingController usernameController,
      emailController,
      passwordController,
      confirmPasswordController,
      firstnameController,
      lastnameController;
  static RegisterController instance = Get.find();
  AgencyModel? agencyModel;
  List<String> agencyList = [];
  late int agencyValue;

  @override
  void onInit() {
    usernameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    firstnameController = TextEditingController();
    lastnameController = TextEditingController();
    getAgency();
    appController.onSubscriptionConnectivity();
    super.onInit();
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    firstnameController.dispose();
    lastnameController.dispose();
    super.dispose();
  }

  void clear() {
    usernameController.clear();
    firstnameController.clear();
    lastnameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    agencyValue = 0;
  }

  //--------------------------getAgency--------------------------//
  Future<List<String>> getAgency() async {
    isLoading(true);
    try {
      var res = await ApiHandler.get('agencies', null, "");
      if (res == null) {
        isLoading(false);
        return agencyList;
      }
      var data = AgencyModel.fromJson(json.decode(res)).data;
      agencyModel = AgencyModel.fromJson(json.decode(res));
      if (agencyModel!.status == "ok") {
        for (var element in data) {
          agencyList.removeWhere((e) => element.name == e);
          agencyList.add(element.name);
        }
        return agencyList;
      }
    } catch (e) {
      Get.snackbar('Announcement', 'Server Error'); //ignore
    } finally {
      isLoading(false);
    }

    return agencyList;
  }

  handleRegister() async {
    bool isValidate = registerFormKey.currentState!.validate();

    if (isValidate) {
      isLoading(true);
      try {
        var res = await AuthServices.register(
            username: usernameController,
            password: passwordController,
            firstName: firstnameController,
            lastName: lastnameController,
            email: emailController);
        var data = jsonDecode(res);
        if (data['status'] == 400) {
          Get.snackbar('Register Failed', data['message']);
        } else {
          registerFormKey.currentState!.save();
          Get.snackbar('Register', 'Register success');
          Future.delayed(const Duration(seconds: 2), () {
            Get.offNamed(AppRoutes.login);
          });
          clear();
        }
      } catch (e) {
        Get.snackbar('Announcement', 'Server Error'); //ignore
      } finally {
        isLoading(false);
      }
    }
  }
}

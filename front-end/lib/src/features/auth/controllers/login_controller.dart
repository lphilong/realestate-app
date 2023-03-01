import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/controllers.dart';
import '../../../routing/routes.dart';
import '../models/user_model.dart';
import '../../../Api/api_service.dart';
import '../services/auth_service.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;
  final loginFormKey = GlobalKey<FormState>();
  late TextEditingController usernameController, passwordController;
  UserModel? userModel;
  static LoginController instance = Get.find();

  @override
  void onInit() {
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    appController.onSubscriptionConnectivity();
    super.onInit();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  getUser() async {
    var scopedToken = await ApiHandler.getToken();
    if (scopedToken != null) {
      appController.token?.value = scopedToken;
      var res = await ApiHandler.get('usersInfo', null, scopedToken);
      userModel = UserModel.fromJson(json.decode(res));
    }
  }

  clear() {
    usernameController.clear();
    passwordController.clear();
  }

  logout() async {
    await ApiHandler.deleteToken();
    var token = await ApiHandler.getToken();
    if (token == null) {
      await Get.offAllNamed(AppRoutes.auth);
    }
  }

  void login() async {
    bool isValidate = loginFormKey.currentState!.validate();
    if (isValidate) {
      isLoading(true);
      try {
        var res = await AuthServices.login(
            username: usernameController, password: passwordController);
        var data = jsonDecode(res);
        if (data['status'] == 401) {
          Get.snackbar('Login Failed', 'Username or Password is incorrect');
          await clear();
        } else {
          loginFormKey.currentState!.save();
          await ApiHandler.storeToken(data['token']);
          await getUser();
          Get.snackbar('Login', 'Login success');
          await clear();
          Future.delayed(const Duration(seconds: 2), () {
            Get.toNamed(AppRoutes.home);
          });
        }
      } catch (e) {
        Get.snackbar('Announcement', 'Server Error'); //ignore
      } finally {
        isLoading(false);
      }
    }
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widgets/custom_authInput.dart';
import '../../../common_widgets/gradient_btn.dart';
import '../../../constants/controllers.dart';
import '../../search/widgets/search_click.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({super.key});

  @override
  State<RegisterWidget> createState() => _MyWidgetState();
}

String? agencyValue;
List<dynamic> agencyList = [];

class _MyWidgetState extends State<RegisterWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          inputForm(
              "Username",
              Icons.person_outline,
              false,
              registerController.usernameController,
              appController.validateRUserName),
          const SizedBox(
            height: 30,
          ),
          IntrinsicHeight(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: inputForm(
                        'First Name',
                        Icons.person_outline,
                        false,
                        registerController.firstnameController,
                        appController.validateName)),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: inputForm(
                        'Last Name',
                        Icons.person_outline,
                        false,
                        registerController.lastnameController,
                        appController.validateName)),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Obx((() => registerController.isLoading.value == true
              ? const Center(child: CircularProgressIndicator())
              : fieldBtn(
                  context,
                  agencyValue ?? 'Select Agency',
                  () => appController.showDialogs(
                        context,
                        agencyValue ?? 'Select Agency',
                        registerController.agencyList,
                        'Agency',
                        agencyValue,
                        onAgencyChange,
                      ),
                  Icons.menu,
                  Colors.white70,
                  Colors.white.withOpacity(0.3)))),
          const SizedBox(
            height: 30,
          ),
          inputForm("Email", Icons.mail_outline, false,
              registerController.emailController, appController.validateEmail),
          const SizedBox(
            height: 30,
          ),
          inputForm(
              "Password",
              Icons.lock_outline,
              true,
              registerController.passwordController,
              appController.validateRPassword),
          const SizedBox(
            height: 30,
          ),
          inputForm(
              "Re-enter Password",
              Icons.lock_outline,
              true,
              registerController.confirmPasswordController,
              appController.validateConfirmedPassword),
          Obx((() => registerController.isLoading.value == true
              ? const Center(child: CircularProgressIndicator())
              : const Text(""))),
          const SizedBox(
            height: 30,
          ),
          GradientButton(
              onTap: () async {
                await registerController.handleRegister();
                agencyValue = null;
              },
              text: 'Sign Up'),
        ]);
  }

  void onAgencyChange(agency) {
    setState(() {
      agencyValue = agency;
      registerController.agencyValue =
          registerController.agencyList.indexOf(agency) + 1;
      Navigator.pop(context);
    });
  }
}

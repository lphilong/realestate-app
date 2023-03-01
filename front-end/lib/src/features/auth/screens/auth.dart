import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widgets/gradient_btn.dart';
import '../../../constants/constants.dart';
import '../../../routing/routes.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Pallete.backgroundColor),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
            ),
            Column(children: [
              GradientButton(
                  onTap: () {
                    Get.toNamed(Routes.login);
                  },
                  text: 'Sign In'),
              const SizedBox(
                height: 20,
              ),
              GradientButton(
                  onTap: () {
                    Get.toNamed(Routes.register);
                  },
                  text: 'Sign Up'),
            ]),
          ],
        ),
      ),
    );
  }
}

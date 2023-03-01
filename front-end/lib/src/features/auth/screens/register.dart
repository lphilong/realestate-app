import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/constants.dart';
import '../controllers/register_controller.dart';
import '../widgets/register_widget.dart';

class Register extends GetView<RegisterController> {
  const Register({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "Sign Up",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(color: Pallete.backgroundColor),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width,
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: IntrinsicHeight(
                child: Form(
                  key: controller.registerFormKey,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: const RegisterWidget(),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}

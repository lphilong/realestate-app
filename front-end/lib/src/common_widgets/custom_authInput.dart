// ignore: file_names
import "package:flutter/material.dart";
import '../constants/constants.dart';

TextFormField inputForm(
  String text,
  IconData icon,
  bool isPasswordType,
  TextEditingController controller,
  String? Function(String?)? validator,
) {
  return TextFormField(
    validator: validator,
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.white.withOpacity(0.9)),
    decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Colors.white70,
        ),
        labelText: text,
        labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Colors.white.withOpacity(0.3),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(90),
            borderSide: const BorderSide(
              color: Pallete.gradient2,
              width: 3,
            )),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none))),
    keyboardType:
        isPasswordType ? TextInputType.visiblePassword : TextInputType.text,
  );
}

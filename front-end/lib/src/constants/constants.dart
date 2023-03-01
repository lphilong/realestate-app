import 'package:flutter/material.dart';

const String apiUrl = 'https://agency-app-final.herokuapp.com/';

class Pallete {
  static const Color backgroundColor = Color.fromRGBO(24, 24, 32, 1);
  static const Color gradient1 = Color.fromRGBO(187, 63, 221, 1);
  static const Color gradient2 = Color.fromRGBO(251, 109, 169, 1);
  static const Color gradient3 = Color.fromRGBO(255, 159, 124, 1);
  static const Color borderColor = Color.fromRGBO(52, 51, 67, 1);
  static const Color appBar = Colors.white;
  static const Color lightBlue = Color(0xff94a2f2);
  static const Color lightPurple = Color(0xffea91a1);
  static const Color blackText = Colors.black;
  static const Color whiteText = Colors.white;
}

class FontFamily {
  static const lobster = 'lobster';
  static const lb = 'libre_baskerville';
  static const roboto = 'roboto_slab';
  static const qs = 'quicksand';
  static const ns = 'noto_san';
}

class AppFonts {
  static const TextStyle h1 = TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: FontFamily.qs,
      fontSize: 16,
      color: Pallete.lightPurple);
  static const TextStyle h2 = TextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: FontFamily.qs,
      fontSize: 16,
      color: Colors.black);
  static const TextStyle h3 =
      TextStyle(fontFamily: FontFamily.qs, fontSize: 18, color: Colors.black);
  static const TextStyle h4 = TextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: FontFamily.ns,
      fontSize: 24,
      color: Pallete.lightBlue);
  static const TextStyle h5 = TextStyle(
      fontFamily: FontFamily.lobster, fontSize: 32, color: Colors.pink);
  static const TextStyle h6 = TextStyle(
      fontFamily: FontFamily.qs, fontSize: 16, color: Colors.blueAccent);
  static const TextStyle h7 = TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: FontFamily.lb,
      fontSize: 14,
      color: Colors.black);
  static const TextStyle h8 =
      TextStyle(fontFamily: FontFamily.qs, fontSize: 14, color: Colors.grey);
  static const TextStyle h9 = TextStyle(
      fontFamily: FontFamily.qs, fontSize: 16, color: Colors.blueAccent);
  static const TextStyle h10 = TextStyle(
      fontFamily: FontFamily.roboto, fontSize: 18, color: Pallete.lightPurple);
  static const TextStyle h11 = TextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: FontFamily.qs,
      fontSize: 18,
      color: Colors.green);
  static const TextStyle h12 = TextStyle(
      fontFamily: FontFamily.roboto, fontSize: 14, color: Colors.grey);
  static const TextStyle h13 =
      TextStyle(fontFamily: FontFamily.qs, fontSize: 14, color: Colors.black);
  static const TextStyle h14 = TextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: FontFamily.ns,
      fontSize: 22,
      color: Pallete.lightPurple);
  static const TextStyle h15 = TextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: FontFamily.qs,
      fontSize: 18,
      color: Colors.black);
}

import 'package:flutter/material.dart';

import '../constants/constants.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({Key? key, required this.onTap, required this.text})
      : super(key: key);
  final Function onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 50,
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Pallete.gradient1,
              Pallete.gradient2,
              Pallete.gradient3,
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
          borderRadius: BorderRadius.circular(90),
        ),
        child: ElevatedButton(
          onPressed: () {
            onTap();
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.transparent;
                }
                return Colors.transparent;
              }),
              shadowColor: MaterialStateProperty.all(Colors.transparent),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)))),
          child: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 17,
            ),
          ),
        ),
      ),
    );
  }
}

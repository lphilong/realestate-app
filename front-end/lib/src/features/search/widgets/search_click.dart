import "package:flutter/material.dart";

Container fieldBtn(BuildContext context, String title, Function onTap,
    IconData icon, Color color, Color bgColor) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(90.0))),
        shadowColor: MaterialStateProperty.all(bgColor),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.black.withOpacity(0.1);
          }
          return Colors.white.withOpacity(0.2);
        }),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(color: color, fontSize: 16),
          ),
          Icon(
            icon,
            color: color,
          )
        ],
      ),
    ),
  );
}

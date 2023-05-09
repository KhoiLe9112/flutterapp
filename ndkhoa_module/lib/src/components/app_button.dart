import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  String text;
  Color backColor;
  Color textColor;
  double radius;
  double textSize;
  double horizontal;
  double vertical;
  Function()? navigate;
  AppButton({
    this.navigate,
    required this.text,
    required this.backColor,
    required this.textColor,
    required this.radius,
    required this.textSize,
    required this.horizontal,
    required this.vertical,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          padding:
              EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
          backgroundColor: backColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius))),
      onPressed: navigate,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: textColor,
              fontSize: textSize),
        ),
      ),
    );
  }
}

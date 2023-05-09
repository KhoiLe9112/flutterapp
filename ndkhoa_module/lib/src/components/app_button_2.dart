import 'package:flutter/material.dart';

class ButtonCustom2 extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  final Color textColor;
  final Color backgroundColor;
  const ButtonCustom2(
      {super.key,
      required this.onPressed,
      required this.text,
      this.textColor = Colors.white,
      this.backgroundColor = Colors.blue});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: backgroundColor,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
      ),
    );
  }
}

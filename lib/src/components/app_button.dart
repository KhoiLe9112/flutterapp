import 'package:flutter/material.dart';
import 'package:qlvbdh/src/presentations/search_result.dart';

class AppButton extends StatelessWidget {
  String text;
  Color backColor;
  Color textColor;
  AppButton({
    required this.text,
    required this.backColor,
    required this.textColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16),
        backgroundColor: backColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        )
      ),
      onPressed: () {},
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: textColor,
              fontSize: 14),
        ),
      ),
    );
  }
}
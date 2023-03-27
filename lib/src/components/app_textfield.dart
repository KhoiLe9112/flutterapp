import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  TextFieldCustom(
      {super.key,
      this.obscureText = false,
      required this.hideText,
      required this.icon,
      required this.controller});
  String hideText;
  Widget icon;
  TextEditingController controller;
  bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          // width: 0.0 produces a thin "hairline" border
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(48),
        ),
        focusedBorder: OutlineInputBorder(
          // width: 0.0 produces a thin "hairline" border
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(48),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(48),
        ),
        hintText: hideText,
        hintStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
        prefixIcon: Container(
          margin: const EdgeInsets.only(left: 32, right: 16),
          child: icon,
        ),
      ),
    );
  }
}
/*
const Icon(
            Icons.account_circle_rounded,
            // size: 32,
            color: Colors.white,
          )
 */
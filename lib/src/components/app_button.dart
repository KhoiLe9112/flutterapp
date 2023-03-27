import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonCustom extends StatefulWidget {
  ButtonCustom(
      {super.key,
      required this.text,
      this.isActive = true,
      this.loading = false,
      required this.onPressed});
  String text;
  bool isActive = true;
  Function() onPressed;
  bool loading = false;

  @override
  State<ButtonCustom> createState() => _ButtonCustomState();
}

class _ButtonCustomState extends State<ButtonCustom> {
  @override
  Widget build(BuildContext context) {
    // print(widget.loading);
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        // backgroundColor: Colors.white,
        minimumSize: Size(Get.width, 56),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(48),
        ),
      ),
      child: widget.loading == true
          ? const CircularProgressIndicator(
              color: Colors.white,
            )
          : Text(
              widget.text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
    );
  }
}

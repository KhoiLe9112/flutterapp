import 'package:flutter/material.dart';

class TextFieldCustom1 extends StatelessWidget {
  const TextFieldCustom1(
    {super.key,}
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const TextField(
        style: TextStyle(fontSize: 28),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 25),
        ),
      ),
    );
  }
}

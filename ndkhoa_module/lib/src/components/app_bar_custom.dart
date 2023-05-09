import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget {
  AppBarCustom({super.key, required this.title});
  String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 30, fontWeight: FontWeight.w300, color: Colors.black),
      ),
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, size: 40, color: Colors.blue.shade800)),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.add, size: 40, color: Colors.black),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search, size: 40, color: Colors.black),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';

class Layout extends StatelessWidget {
  Layout({super.key, required this.child});
  Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColor.primaryColor, AppColor.secondaryColor],
        ),
      ),
      child: child,
    );
  }
}

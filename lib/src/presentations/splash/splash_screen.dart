import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hue_moffice/src/components/app_layout.dart';
import 'package:hue_moffice/src/presentations/splash/controllers/splash_controller.dart';

class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Layout(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: Get.width,
            // color: Colors.red,
            child: ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  colors: [Colors.red, Colors.green],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds);
              },
              child: const Text(
                "Hue mOffice",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 32,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 120),
            child: const CircularProgressIndicator(
              color: Colors.white,
            ),
          )
        ],
      )),
    );
  }
}

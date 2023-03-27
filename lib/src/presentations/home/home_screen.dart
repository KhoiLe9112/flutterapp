import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hue_moffice/src/presentations/auth/controllers/auth_controller.dart';
import 'package:hue_moffice/src/presentations/home/controllers/home_controller.dart';

class HomeScreen extends GetWidget<HomeController> {
  HomeScreen({super.key});
  var authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Home screen"),
          SizedBox(
            width: Get.width,
            child: Text(
              "Token: ${controller.userToken}",
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              authController.logout();
            },
            child: const Text("Logout"),
          )
        ],
      ),
    ));
  }
}

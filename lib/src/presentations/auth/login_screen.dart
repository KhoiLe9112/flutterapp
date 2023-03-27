import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hue_moffice/src/components/app_button.dart';
import 'package:hue_moffice/src/components/app_layout.dart';
import 'package:hue_moffice/src/components/app_textfield.dart';
import 'package:hue_moffice/src/core/enum/login_status.dart';
import 'package:hue_moffice/src/presentations/auth/controllers/auth_controller.dart';

class LoginScreen extends GetWidget<AuthController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Layout(
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              height: Get.height,
              alignment: Alignment.center,
              child: Obx(() {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(8),
                      child: TextFieldCustom(
                        hideText: "Tên đăng nhập / email công vụ",
                        icon: const Icon(
                          Icons.account_circle_rounded,
                          // size: 32,
                          color: Colors.white,
                        ),
                        controller: controller.accountController.value,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(8),
                      child: TextFieldCustom(
                        obscureText: true,
                        hideText: "Mật khẩu",
                        icon: const Icon(
                          Icons.lock,
                          // size: 32,
                          color: Colors.white,
                        ),
                        controller: controller.passwordController.value,
                      ),
                    ),
                    Container(
                      width: Get.width,
                      margin: const EdgeInsets.all(8),
                      child: ButtonCustom(
                        text: "Đăng nhập",
                        onPressed: () {
                          controller.handleLogin();
                        },
                        // ignore: unrelated_type_equality_checks
                        loading: (controller.status == LoginStatus.loading),
                      ),
                    )
                  ],
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}

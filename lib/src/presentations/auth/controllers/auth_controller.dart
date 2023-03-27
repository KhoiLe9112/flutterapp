import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:hue_moffice/src/core/enum/login_status.dart';
import 'package:hue_moffice/src/data/apiClient/auth/auth_client.dart';
import 'package:hue_moffice/src/router/app_router.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthController extends GetxController {
  final storage = const FlutterSecureStorage();
  Rx<TextEditingController> accountController = Rx(TextEditingController());
  Rx<TextEditingController> passwordController = Rx(TextEditingController());
  Rx<LoginStatus> status = LoginStatus.init.obs;
  Rx<String> messages = "".obs;

  handleLogin() async {
    print("Login");
    status(LoginStatus.loading);
    var client = AuthClient();
    try {
      var response = await client.login(
          username: accountController.value.text,
          password: passwordController.value.text);
      if (kDebugMode) {
        print(response.toJson());
      }
      if (response.success!) {
        await storage.write(key: "UserToken", value: response.token);
        Get.toNamed(AppRouter.homeScreen);
        status(LoginStatus.success);
      } else {
        status(LoginStatus.faild);
        messages(response.message);
        Fluttertoast.showToast(
          msg: response.message ?? "",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
      // navigation to Home page
    } catch (e) {
      status(LoginStatus.faild);
      messages(e.toString());
      rethrow;
    }
  }

  logout() {
    storage.delete(key: "UserToken");
    Get.toNamed(AppRouter.loginScreen);
  }
}

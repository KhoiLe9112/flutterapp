import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final storage = const FlutterSecureStorage();
  Rx<String> userToken = "".obs;

  Future<void> getToken() async {
    var token = await storage.read(key: "UserToken");
    userToken(token);
  }

  @override
  void onInit() {
    super.onInit();
    getToken();
  }
}

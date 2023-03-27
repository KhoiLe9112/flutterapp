import 'package:get/get.dart';
import 'package:hue_moffice/src/presentations/auth/controllers/auth_controller.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
  }
}

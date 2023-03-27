import 'package:get/get.dart';
import 'package:hue_moffice/src/presentations/home/controllers/home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}

import 'package:get/get.dart';
import 'package:ndkhoa_module/src/presentations/home/controllers/home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}

import 'package:get/get.dart';
import 'package:ndkhoa_module/src/presentations/incoming_text/controllers/incoming_text_controllers.dart';

class IncomingTextBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(IncomingTextController());
  }
}

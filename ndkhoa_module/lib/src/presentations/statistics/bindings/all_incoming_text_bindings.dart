import 'package:get/get.dart';
import 'package:ndkhoa_module/src/presentations/statistics/controllers/all_incoming_text_controllers.dart';

class AllIncomingTextBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AllIncomingTextController());
  }
}

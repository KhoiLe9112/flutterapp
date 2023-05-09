import 'package:get/get.dart';
import 'package:ndkhoa_module/src/presentations/statistics/controllers/statistics_controllers.dart';

class StatisticsBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(StatisticsController());
  }
}

import 'package:get/get.dart';
import 'package:ndkhoa_module/src/presentations/tasks/controllers/new_task_controllers.dart';

class NewTaskBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NewTaskController());
  }
}

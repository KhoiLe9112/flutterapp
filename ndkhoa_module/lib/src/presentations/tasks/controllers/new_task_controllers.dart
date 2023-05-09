import 'package:get/get.dart';

class NewTaskController extends GetxController {
  // final storage = const FlutterSecureStorage();
  Rx<List<String>> listGroup = Rx(<String> [
    "Phòng Dịch vụ Hà tầng",
    "Phòng Đào tạo",
    "Phòng Hành chính tổng hợp",
    "Phòng Nghiên cứu triển khai"
  ]);
  Rx<List<String>> listSingle = Rx(<String> [
    "Lê Phước Bình",
    "Nguyễn Hữu Thành Nam",
    "Nguyễn Thị Thu Thủy",
    "Nguyễn Văn Tình",
    "Trần Anh Hiền",
    "Nguyễn Thành Mãn",
    "Phùng Văn Hòa"
  ]);
  Rx<String> single = "".obs;
  Rx<DateTime> date = Rx(DateTime.now());
  Rx<List<String>> listMoreInfo = Rx(<String>[
    "Nguồn gốc công việc",
    "Hồ sơ dự án",
    "Công việc cấp cha"
  ]);
  Rx<bool> boolMoreInfo = Rx(false);
  Rx<List<String>> listFollowers = Rx(<String>[
    "Nguyễn Văn Tình",
    "Nguyễn Thị Thanh Thủy"
  ]);
  Rx<bool> boolCTTH = Rx(true);
  Rx<bool> boolNGV = Rx(true);

  // void valueChange() {
  //   listSingle.value.clear();
  //   listSingle.value.add("test");
  // }
}

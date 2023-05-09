import 'package:get/get.dart';

class AllIncomingTextController extends GetxController {
  // final storage = const FlutterSecureStorage();
  Rx<List<String>> listFilter = Rx(<String>[
    'Trao đổi',
    'Chưa thực hiện',
    'Đang thực hiện',
    'Hoàn thành',
    'Chờ xác nhận',
    'Xin ý kiến ban hành',
    'Theo dõi'
  ]);
  Rx<int> dropDownFilterValue = 0.obs;
  Rx<List<String>> listFilter2 = Rx(<String>[
    'Tất cả',
    'Phản ánh kiến nghị',
    'Chương trình công tác',
    'QLVB và Điều hành',
    'Ý kiến chỉ đạo'
  ]);
  Rx<int> dropDownFilterValue2 = 0.obs;
}

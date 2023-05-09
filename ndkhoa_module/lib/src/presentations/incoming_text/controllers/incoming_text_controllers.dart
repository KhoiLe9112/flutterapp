import 'package:get/get.dart';

class IncomingTextController extends GetxController {
  // final storage = const FlutterSecureStorage();
  Rx<List<String>> listYear = Rx(<String>[
    '2023',
    '2022',
    '2021',
    '2020',
    '2019',
    '2018'
  ]);
  Rx<int> dropDownYearValue = 0.obs;
  Rx<List<String>> listFilter = Rx(<String>[
    'Văn bản sao y',
    'Nhận để biết',
    'Đến trong ngày',
    'Toàn bộ VB đến'
  ]);
  Rx<int> dropDownFilterValue = (-1).obs;
  Rx<List<String>> listSort = Rx(<String>[
    'Theo số/ký hiệu gốc',
    'Theo ngày đến',
    'Theo ngày vào sổ',
    'Theo ngày ban hành',
    'Theo cơ quan ban hành'
  ]);
  Rx<int> dropDownSortValue = 0.obs;
  Rx<List<String>> listSort2 = Rx(<String>['Tăng dần', 'Giảm dần']);
  Rx<int> dropDownSortValue2 = 0.obs;
}

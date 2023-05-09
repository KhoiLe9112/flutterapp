import 'package:get/get.dart';
import 'package:intl/intl.dart';

class StatisticsController extends GetxController {
  // final storage = const FlutterSecureStorage();
  Rx<List<String>> list = Rx(<String>[
    'Việc của tôi',
    'Việc phòng ban',
    'Việc cơ quan',
  ]);
  Rx<List<String>> listtitle1 = Rx(<String>[
    'Toàn bộ công việc',
    'Cơ quan',
    'Toàn tỉnh',
  ]);
  Rx<List<String>> listtitle2 = Rx(<String>[
    'Nguồn công việc',
    'Phòng ban',
    'Sở ban ngành',
  ]);
  Rx<int> dropDownValue = 0.obs;
  // Rx<DateTime> statisticsDateFrom = DateTime.now().obs;
  // Rx<DateTime> statisticsDateTo = DateTime.now().obs;
  Rx<DateFormat> format = Rx(DateFormat("dd/MM/yyyy"));
  Rx<String> statisticsDateFrom = "13/10/2018".obs;
  Rx<String> statisticsDateTo = "13/11/2018".obs;

  
}

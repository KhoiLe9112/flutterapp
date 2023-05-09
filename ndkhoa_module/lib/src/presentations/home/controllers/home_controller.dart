import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final storage = const FlutterSecureStorage();

  Rx<String> userToken = "".obs;

  //tam thoi List<String>. List<Model>
  Rx<List<String>> dailyWork = Rx(<String>[
    'Họp rà soát nhiệm vụ 2019',
    'Gặp mặt khách hàng',
    'Gặp mặt khách hàng',
    'Gặp mặt khách hàng',
    'Gặp mặt khách hàng',
    'Gặp mặt khách hàng',
    'Gặp mặt khách hàng',
    'Gặp mặt khách hàng',
  ]);

  Future<void> getToken() async {
    var token = await storage.read(key: "UserToken");
    userToken(token);
  }

  @override
  void onInit() {
    super.onInit();
    getToken();
  }
}

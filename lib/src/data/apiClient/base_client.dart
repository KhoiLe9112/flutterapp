import 'package:get/get.dart';
import 'package:hue_moffice/src/core/constants/app_url.dart';

class BaseClient extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = AppEndpoint.PRODUCT_URL;
  }
}

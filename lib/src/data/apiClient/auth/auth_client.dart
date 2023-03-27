import 'dart:convert';

import 'package:hue_moffice/src/core/constants/app_url.dart';
import 'package:hue_moffice/src/data/apiClient/base_client.dart';
import 'package:hue_moffice/src/data/models/user/user_info.dart';
import 'package:hue_moffice/src/data/models/user/user_payload.dart';

class AuthClient extends BaseClient {
  Future<UserInfo> login(
      {required String username, required String password}) async {
    var url = "${AppEndpoint.PRODUCT_URL}/api/AuthenToken/login";
    var user =
        UserPayload(username: username, password: password, appCode: "HSCV");
    var response = await post(url, user.toJson());
    if (response.statusCode == 200) {
      return UserInfo.fromJson(jsonDecode(response.bodyString ?? ""));
    } else {
      throw Exception("Username or password don't exist");
    }
  }
}

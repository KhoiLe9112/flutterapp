class UserPayload {
  String? username;
  String? password;
  String? appCode = "HSCV";

  UserPayload({this.username, this.password, this.appCode});

  UserPayload.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    appCode = json['AppCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['password'] = password;
    data['AppCode'] = appCode;
    return data;
  }
}

class UserInfo {
  bool? success;
  String? token;
  String? refreshToken;
  String? message;
  String? fullName;
  String? email;
  String? cellPhone;
  String? address;
  String? ownerCode;
  bool? gender;
  String? avatar;
  bool? verifyed;
  String? identifierCode;
  int? errCode;

  UserInfo(
      {this.success,
      this.token,
      this.refreshToken,
      this.message,
      this.fullName,
      this.email,
      this.cellPhone,
      this.address,
      this.ownerCode,
      this.gender,
      this.avatar,
      this.verifyed,
      this.identifierCode,
      this.errCode});

  UserInfo.fromJson(Map<String, dynamic> json) {
    success = json['Success'];
    token = json['Token'];
    refreshToken = json['RefreshToken'];
    message = json['Message'];
    fullName = json['FullName'];
    email = json['Email'];
    cellPhone = json['CellPhone'];
    address = json['Address'];
    ownerCode = json['OwnerCode'];
    gender = json['Gender'];
    avatar = json['Avatar'];
    verifyed = json['Verifyed'];
    identifierCode = json['IdentifierCode'];
    errCode = json['ErrCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Success'] = success;
    data['Token'] = token;
    data['RefreshToken'] = refreshToken;
    data['Message'] = message;
    data['FullName'] = fullName;
    data['Email'] = email;
    data['CellPhone'] = cellPhone;
    data['Address'] = address;
    data['OwnerCode'] = ownerCode;
    data['Gender'] = gender;
    data['Avatar'] = avatar;
    data['Verifyed'] = verifyed;
    data['IdentifierCode'] = identifierCode;
    data['ErrCode'] = errCode;
    return data;
  }
}

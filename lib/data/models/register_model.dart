class RegisterModel {
  String? code;
  String? message;
  Data? data;

  RegisterModel({this.code, this.message, this.data});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? email;
  String? password;
  String? name;
  String? gender;
  String? phoneNumber;
  int? gradeId;
  int? roleId;

  Data(
      {this.email,
      this.password,
      this.name,
      this.gender,
      this.phoneNumber,
      this.gradeId,
      this.roleId});

  Data.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    name = json['name'];
    gender = json['gender'];
    phoneNumber = json['phoneNumber'];
    gradeId = json['gradeId'];
    roleId = json['roleId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['name'] = name;
    data['gender'] = gender;
    data['phoneNumber'] = phoneNumber;
    data['gradeId'] = gradeId;
    data['roleId'] = roleId;
    return data;
  }
}

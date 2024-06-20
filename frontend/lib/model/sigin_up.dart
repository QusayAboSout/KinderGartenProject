import 'package:frontend/model/user.dart';

class SiginUpDto {
  User? user;
  String? code;

  SiginUpDto({this.user, this.code});

  SiginUpDto.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['code'] = this.code;
    return data;
  }
}

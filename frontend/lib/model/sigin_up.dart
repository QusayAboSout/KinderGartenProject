import 'package:frontend/model/user.dart';

class SiginUpDto {
  User? user;
  String? code;

  SiginUpDto({this.user, this.code});

  SiginUpDto.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['code'] = code;
    return data;
  }
}

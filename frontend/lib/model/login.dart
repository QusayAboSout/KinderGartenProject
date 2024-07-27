class LoginDto {
  String? userName;
  String? password;
  String? googleAuthTokin;

  LoginDto({this.userName, this.password, this.googleAuthTokin});

  LoginDto.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    googleAuthTokin = json['googleAuthTokin'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userName'] = userName;
    data['googleAuthTokin'] = googleAuthTokin;
    data['password'] = password;
    return data;
  }
}

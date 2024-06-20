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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['googleAuthTokin'] = this.googleAuthTokin;
    data['password'] = this.password;
    return data;
  }
}

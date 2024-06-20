class Auth {
  num? userId;
  String? token;

  Auth({this.userId, this.token});

  Auth.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userid'] = this.userId;
    data['token'] = this.token;
    return data;
  }
}

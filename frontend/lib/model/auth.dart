class Auth {
  num? userId;
  String? token;

  Auth({this.userId, this.token});

  Auth.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userid'] = userId;
    data['token'] = token;
    return data;
  }
}

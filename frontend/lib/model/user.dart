class User {
  num? id;
  String? userName;
  String? password;
  String? name;
  String? email;
  String? role;
  bool? isActive;
  String? googleAccessToken;
  String? mobileNo;

  User({
    this.id,
    this.userName,
    this.password,
    this.name,
    this.email,
    this.role,
    this.isActive,
    this.googleAccessToken,
    this.mobileNo,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    password = json['password'];
    name = json['name'];
    email = json['email'];
    role = json['role'];
    isActive = json['isActive'];
    googleAccessToken = json['googleAccessToken'];
    mobileNo = json['mobileNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userName'] = userName;
    data['password'] = password;
    data['name'] = name;
    data['email'] = email;
    data['role'] = role;
    data['isActive'] = isActive;
    data['googleAccessToken'] = googleAccessToken;
    data['mobileNo'] = mobileNo;
    return data;
  }
}

class UserPaginationResult {
  List<User>? data;
  num? count;

  UserPaginationResult({this.data, this.count});

  UserPaginationResult.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <User>[];
      json['data'].forEach((v) {
        data!.add(User.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['childCard'] = this.data!.map((v) => v.toJson()).toList();
      data['count'] = count;
    return data;
  }
}
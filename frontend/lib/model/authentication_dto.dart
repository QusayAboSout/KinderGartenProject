class AuthenticationDto {
  String? authToken;
  String? refreshToken;
  String? expiresIn;
  num? userID;

  AuthenticationDto({this.authToken, this.refreshToken, this.expiresIn});

  AuthenticationDto.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    authToken = json['authToken'];
    refreshToken = json['refreshToken'];
    expiresIn = json['expiresIn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userID'] = userID;
    data['authToken'] = authToken;
    data['refreshToken'] = refreshToken;
    data['expiresIn'] = expiresIn;
    return data;
  }
}

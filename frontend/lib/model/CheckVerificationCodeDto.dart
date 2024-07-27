class CheckVerificationCodeDto {
  String? email;
  String? verificationCode;

  CheckVerificationCodeDto({this.email, this.verificationCode});

  CheckVerificationCodeDto.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    verificationCode = json['verificationCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['verificationCode'] = verificationCode;
    return data;
  }
}

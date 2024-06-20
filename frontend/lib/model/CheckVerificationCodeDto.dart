class CheckVerificationCodeDto {
  String? email;
  String? verificationCode;

  CheckVerificationCodeDto({this.email, this.verificationCode});

  CheckVerificationCodeDto.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    verificationCode = json['verificationCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['verificationCode'] = this.verificationCode;
    return data;
  }
}

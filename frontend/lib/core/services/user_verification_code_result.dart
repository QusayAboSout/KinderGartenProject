class UserVerificationCodeResult {
  bool? waitError;
  String? expiredDate;
  int? requestCount;
  String? createDate;
  String? email;
  String? mobileNumber;

  UserVerificationCodeResult(
      {this.waitError,
      this.expiredDate,
      this.requestCount,
      this.createDate,
      this.email,
      this.mobileNumber});

  UserVerificationCodeResult.fromJson(Map<String, dynamic> json) {
    waitError = json['waitError'];
    expiredDate = json['expiredDate'];
    requestCount = json['requestCount'];
    createDate = json['createDate'];
    email = json['email'];
    mobileNumber = json['mobileNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['waitError'] = waitError;
    data['expiredDate'] = expiredDate;
    data['requestCount'] = requestCount;
    data['createDate'] = createDate;
    data['email'] = email;
    data['mobileNumber'] = mobileNumber;
    return data;
  }
}

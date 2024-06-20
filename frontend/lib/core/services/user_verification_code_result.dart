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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['waitError'] = this.waitError;
    data['expiredDate'] = this.expiredDate;
    data['requestCount'] = this.requestCount;
    data['createDate'] = this.createDate;
    data['email'] = this.email;
    data['mobileNumber'] = this.mobileNumber;
    return data;
  }
}

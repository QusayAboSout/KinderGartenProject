class GuardianDto {
  num? id;
  String? guardianName;
  num? guardianTypeID;
  num? contactNumbersID;
  num? userID;

  GuardianDto({
    this.id,
    this.guardianName,
    this.guardianTypeID,
    this.contactNumbersID,
    this.userID,
  });

  GuardianDto.fromJson(Map<String, dynamic> json) {
    id = json['ID'] ?? 0;
    guardianName = json['GurdianName'];
    guardianTypeID = json['GuardianTypeID'];
    contactNumbersID = json['ContactNumbersID'];
    userID = json['UserID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = id ?? 0;
    data['GurdianName'] = guardianName;
    data['GuardianTypeID'] = guardianTypeID ?? 0;
    data['ContactNumbersID'] = contactNumbersID ?? 0;
    data['UserID'] = userID ?? 0;
    return data;
  }
}

class GuardianPaginationResult {
  List<GuardianDto>? data;
  int? count;

  GuardianPaginationResult({this.data, this.count});

  GuardianPaginationResult.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <GuardianDto>[];
      json['data'].forEach((v) {
        data!.add(GuardianDto.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['guardian'] = this.data!.map((v) => v.toJson()).toList();
    data['count'] = count;
    return data;
  }
}

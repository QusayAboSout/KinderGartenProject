class ChildCardDto {
  num? id;
  String? studentName;
  String? fatherName;
  String? grandFatherName;
  String? familyName;
  String? birthOfDate;
  String? address;
  String? phoneNumber;
  String? childLivesWith;
  String? parentsSituation;
  num? userID;
  bool? isCheck;
  bool? status;
  String? rejectReason;

  ChildCardDto({
    this.id,
    this.studentName,
    this.fatherName,
    this.grandFatherName,
    this.familyName,
    this.birthOfDate,
    this.address,
    this.phoneNumber,
    this.childLivesWith,
    this.parentsSituation,
    this.userID,
    this.isCheck,
    this.status,
    this.rejectReason,
  });

  ChildCardDto.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('id')) {
      id = json['id'];
    } else {
      id = 0;
    }
    studentName = json['studentName'];
    fatherName = json['fatherName'];
    grandFatherName = json['grandFatherName'];
    familyName = json['familyName'];
    birthOfDate = json['birthOfDate'];
    address = json['address'];
    phoneNumber = json['phoneNumber'];
    childLivesWith = json['childLivesWith'];
    parentsSituation = json['parentsSituation'];
    userID = json['userID'];
    isCheck = json['isCheck'];
    status = json['status'];
    rejectReason = json['rejectReason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['studentName'] = studentName;
    data['fatherName'] = fatherName;
    data['grandFatherName'] = grandFatherName;
    data['familyName'] = familyName;
    data['birthOfDate'] = birthOfDate;
    data['address'] = address;
    data['phoneNumber'] = phoneNumber;
    data['childLivesWith'] = childLivesWith;
    data['parentsSituation'] = parentsSituation;
    data['id'] = id;
    data['userID'] = userID;
    data['isCheck'] = isCheck;
    data['status'] = status;
    data['rejectReason'] = rejectReason;
    return data;
  }
}

/////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////

class ChildCardPaginationResult {
  List<ChildCardDto>? data;
  num? count;

  ChildCardPaginationResult({this.data, this.count});

  ChildCardPaginationResult.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ChildCardDto>[];
      json['data'].forEach((v) {
        data!.add(ChildCardDto.fromJson(v));
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

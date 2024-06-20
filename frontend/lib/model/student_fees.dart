class StudentFeesDto {
  int? id;
  int? feesAmount;
  DateTime? feesDate;
  bool? withBus;
  int? studentID;
  int? classID;

  StudentFeesDto({
    this.id,
    this.feesAmount,
    this.feesDate,
    this.withBus,
    this.studentID,
    this.classID,
  });

  StudentFeesDto.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    feesAmount = json['FeesAmount'];
    feesDate = json['FeesDate'] != null
        ? DateTime.fromMillisecondsSinceEpoch(json['FeesDate'])
        : null;
    withBus = json['WithBus'];
    studentID = json['StudentID'];
    classID = json['ClassID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = id;
    data['FeesAmount'] = feesAmount;
    // Assuming 'FeesDate' needs to be converted to a timestamp in milliseconds
    data['FeesDate'] = feesDate?.millisecondsSinceEpoch;
    data['WithBus'] = withBus;
    data['StudentID'] = studentID;
    data['ClassID'] = classID;
    return data;
  }
}

class StudentFeesPaginationResult {
  List<StudentFeesDto>? data;
  num? count;

  StudentFeesPaginationResult({this.data, this.count});

  StudentFeesPaginationResult.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <StudentFeesDto>[];
      json['data'].forEach((v) {
        data!.add(StudentFeesDto.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['studentFees'] = this.data!.map((v) => v.toJson()).toList();
    data['count'] = count;
    return data;
  }
}



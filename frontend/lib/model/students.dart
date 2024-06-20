class StudentDto {
  num? id;
  String? studentName;
  String? studentLocation;
  String? parentPhoneNumber;
  num? classID;
  num? userID;
  num? generalEvaluationID;
  num? progressEvaluationID;
  num? attendanceID;
  num? childCardID;
  String? birthCertificateImageID;
  String? parentCertificateImageID;
  String? personalImageID;

  StudentDto({
    this.id,
    this.studentName,
    this.studentLocation,
    this.parentPhoneNumber,
    this.classID,
    this.userID,
    this.generalEvaluationID,
    this.progressEvaluationID,
    this.attendanceID,
    this.childCardID,
    this.birthCertificateImageID,
    this.parentCertificateImageID,
    this.personalImageID,
  });

  StudentDto.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('id')) {
      id = json['id'];
    } else {
      id = 0;
    }
    studentName = json['studentName'];
    studentLocation = json['studentLocation'];
    parentPhoneNumber = json['parentPhoneNumber'];
    classID = json['classID'];
    userID = json['userID'];
    generalEvaluationID = json['generalEvaluationID'];
    progressEvaluationID = json['progressEvaluationID'];
    attendanceID = json['attendanceID'];
    childCardID = json['childCardID'];
    birthCertificateImageID = json['birthCertificateImageID'];
    parentCertificateImageID = json['parentCertificateImageID'];
    personalImageID = json['personalImageID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['studentName'] = studentName;
    data['studentLocation'] = studentLocation;
    data['parentPhoneNumber'] = parentPhoneNumber;
    data['classID'] = classID;
    data['userID'] = userID;
    data['generalEvaluationID'] = generalEvaluationID;
    data['progressEvaluationID'] = progressEvaluationID;
    data['attendanceID'] = attendanceID;
    data['childCardID'] = childCardID;
    data['birthCertificateImageID'] = birthCertificateImageID;
    data['parentCertificateImageID'] = parentCertificateImageID;
    data['personalImageID'] = personalImageID;
    return data;
  }
}

class StudentPaginationResult {
  List<StudentDto>? data;
  num? count;

  StudentPaginationResult({this.data, this.count});

  StudentPaginationResult.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <StudentDto>[];
      json['data'].forEach((v) {
        data!.add(StudentDto.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['count'] = count;
    return data;
  }
}

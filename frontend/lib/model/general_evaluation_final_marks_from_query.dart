class GetStudentFinalMarksFromQuery {
  String? studentID;
  String? classID;

  GetStudentFinalMarksFromQuery({
    this.studentID,
    this.classID,
  });

  GetStudentFinalMarksFromQuery.fromJson(Map<String, dynamic> json) {
    studentID = json['studentID'] ?? 0;
    classID = json['classID'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['studentID'] = studentID ?? 0;
    data['classID'] = classID ?? 0;
    return data;
  }
}

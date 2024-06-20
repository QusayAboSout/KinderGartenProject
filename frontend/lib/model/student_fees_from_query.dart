class GetStudentFeesFromQuery {
  String? studentID;
  String? classID;

  GetStudentFeesFromQuery({
    this.studentID,
    this.classID,
  });

  GetStudentFeesFromQuery.fromJson(Map<String, dynamic> json) {
    studentID = json['studentID'] ?? 0;
    classID = json['classID'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['classID'] = classID ?? 0;
    data['studentID'] = studentID ?? 0;
    return data;
  }
}

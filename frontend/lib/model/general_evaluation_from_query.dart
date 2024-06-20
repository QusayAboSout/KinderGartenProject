class GetSubjectGeneralEvaluationForStudent {
  String? studentID;
  String? subjectID;
  String? classID;

  GetSubjectGeneralEvaluationForStudent({
    this.studentID,
    this.subjectID,
    this.classID,
  });

  GetSubjectGeneralEvaluationForStudent.fromJson(Map<String, dynamic> json) {
    studentID = json['studentID'] ?? 0;
    subjectID = json['subjectID'] ?? 0;
    classID = json['classID'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subjectID'] = subjectID ?? 0;
    data['studentID'] = studentID ?? 0;
    data['classID'] = classID ?? 0;
    return data;
  }
}

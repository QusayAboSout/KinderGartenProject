class GetUnitsProgressEvaluationForStudents {
  String? studentID;
  String? subjectID;

  GetUnitsProgressEvaluationForStudents({
    this.studentID,
    this.subjectID,
  });

  GetUnitsProgressEvaluationForStudents.fromJson(Map<String, dynamic> json) {
    studentID = json['studentID'] ?? 0;
    subjectID = json['subjectID'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subjectID'] = subjectID ?? 0;
    data['studentID'] = studentID ?? 0;
    return data;
  }
}

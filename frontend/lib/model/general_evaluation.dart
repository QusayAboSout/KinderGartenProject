import 'package:frontend/model/subjects.dart';

class GeneralEvaluationDto {
  num? id;
  String? grade;
  num? studentID;
  num? classID;
  num? subjectID;
  SubjectDto? subject;

  GeneralEvaluationDto({
    this.id,
    this.grade,
    this.studentID,
    this.classID,
    this.subjectID,
    this.subject,
  });

  GeneralEvaluationDto.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    grade = json['grade'];
    studentID = json['studentID'];
    classID = json['classID'];
    subjectID = json['subjectID'];
    if(json['subject'] != null){
    subject = SubjectDto.fromJson(json['subject']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id ?? 0;
    data['grade'] = grade;
    data['studentID'] = studentID;
    data['classID'] = classID;
    data['subjectID'] = subjectID;
    return data;
  }
}

class GeneralEvaluationPaginationResult {
  List<GeneralEvaluationDto>? data;
  num? count;

  GeneralEvaluationPaginationResult({this.data, this.count});

  GeneralEvaluationPaginationResult.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <GeneralEvaluationDto>[];
      json['data'].forEach((v) {
        data!.add(GeneralEvaluationDto.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['progressEvaluation'] = this.data!.map((v) => v.toJson()).toList();
    data['count'] = count;
    return data;
  }
}

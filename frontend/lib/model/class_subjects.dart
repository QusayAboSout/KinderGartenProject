import 'package:frontend/model/subjects.dart';

class ClassSubjectsDto {
  num? id;
  num? classID;
  num? subjectID;
  SubjectDto? subjectDto;

  ClassSubjectsDto({
    this.id,
    this.classID,
    this.subjectID,
    this.subjectDto
  });

  ClassSubjectsDto.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    classID = json['classID'];
    subjectID = json['subjectID'];
    if (json['subject'] != null) {
      subjectDto = SubjectDto.fromJson(json['subject']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id ?? 0;
    data['classID'] = classID;
    data['subjectID'] = subjectID;
    return data;
  }
}

class ClassSubjectsPaginationResult {
  List<ClassSubjectsDto>? data;
  num? count;

  ClassSubjectsPaginationResult({this.data, this.count});

  ClassSubjectsPaginationResult.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ClassSubjectsDto>[];
      json['data'].forEach((v) {
        data!.add(ClassSubjectsDto.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['class'] = this.data!.map((v) => v.toJson()).toList();
    data['count'] = count;
    return data;
  }
}

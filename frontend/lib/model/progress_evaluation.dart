import 'package:frontend/model/unit.dart';

class ProgressEvaluationDto {
  num? id;
  String? grade;
  String? date;
  num? studentID;
  num? unitID;
  num? subjectID;
  UnitDto? unit;

  ProgressEvaluationDto(
      {this.id,
      this.grade,
      this.date,
      this.studentID,
      this.unitID,
      this.subjectID,
      this.unit});

  ProgressEvaluationDto.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    grade = json['grade'];
    date = json['date'];
    studentID = json['studentID'];
    unitID = json['unitID'];
    subjectID = json['subjectID'];
    if (json['unit'] != null) {
      unit = UnitDto.fromJson(json['unit']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id ?? 0;
    data['grade'] = grade;
    data['date'] = date;
    data['studentID'] = studentID;
    data['unitID'] = unitID;
    data['subjectID'] = subjectID;
    return data;
  }
}

class ProgressEvaluationPaginationResult {
  List<ProgressEvaluationDto>? data;
  num? count;

  ProgressEvaluationPaginationResult({this.data, this.count});

  ProgressEvaluationPaginationResult.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ProgressEvaluationDto>[];
      json['data'].forEach((v) {
        data!.add(ProgressEvaluationDto.fromJson(v));
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

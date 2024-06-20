class UnitDto {
  num? id;
  String? name;
  num? subjectID;
  num? progressEvaluationID;

  UnitDto({
    this.id,
    this.name,
    this.subjectID,
    this.progressEvaluationID,
  });

  UnitDto.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'];
    subjectID = json['subjectID'];
    progressEvaluationID = json['progressEvaluationID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id ?? 0;
    data['name'] = name;
    data['subjectID'] = subjectID;
    data['progressEvaluationID'] = progressEvaluationID;
    return data;
  }
}


class UnitPaginationResult {
  List<UnitDto>? data;
  num? count;

  UnitPaginationResult({this.data, this.count});

  UnitPaginationResult.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <UnitDto>[];
      json['data'].forEach((v) {
        data!.add(UnitDto.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['unit'] = this.data!.map((v) => v.toJson()).toList();
    data['count'] = count;
    return data;
  }
}

class SubjectDto {
  num? id;
  String? name;
  num? generalEvaluationID;

  SubjectDto({
    this.id,
    this.name,
    this.generalEvaluationID,
  });

  SubjectDto.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'];
    generalEvaluationID = json['generalEvaluationID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id ?? 0;
    data['name'] = name;
    data['generalEvaluationID'] = generalEvaluationID;
    return data;
  }

}


class SubjectPaginationResult {
  List<SubjectDto>? data;
  num? count;

  SubjectPaginationResult({this.data, this.count});

  SubjectPaginationResult.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <SubjectDto>[];
      json['data'].forEach((v) {
        data!.add(SubjectDto.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subject'] = this.data!.map((v) => v.toJson()).toList();
    data['count'] = count;
    return data;
  }
}

class SectionDto {
  num? id;
  String? name;
  num? classID;

  SectionDto({
    this.id,
    this.name,
    this.classID,
  });

  SectionDto.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'];
    classID = json['classID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id ?? 0;
    data['name'] = name;
    data['classID'] = classID;
    return data;
  }

}


class SectionPaginationResult {
  List<SectionDto>? data;
  num? count;

  SectionPaginationResult({this.data, this.count});

  SectionPaginationResult.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <SectionDto>[];
      json['data'].forEach((v) {
        data!.add(SectionDto.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Section'] = this.data!.map((v) => v.toJson()).toList();
    data['count'] = count;
    return data;
  }
}

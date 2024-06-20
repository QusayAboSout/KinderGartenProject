class ClassDto {
  num? id;
  String? className;
  dynamic classYear;
  num? teacherID;
  // String? shoapa;

  ClassDto({
    this.id,
    this.className,
    this.classYear,
    this.teacherID,
    // this.shoapa,
  });

  ClassDto.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    className = json['className'];
    classYear = json['classYear'];
    teacherID = json['teacherID'];
    // shoapa = json['shoapa'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id ?? 0;
    data['className'] = className;
    data['classYear'] = classYear;
    data['teacherID'] = teacherID;
    // data['shoapa'] = shoapa;
    return data;
  }
}

class ClassPaginationResult {
  List<ClassDto>? data;
  num? count;

  ClassPaginationResult({this.data, this.count});

  ClassPaginationResult.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ClassDto>[];
      json['data'].forEach((v) {
        data!.add(ClassDto.fromJson(v));
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

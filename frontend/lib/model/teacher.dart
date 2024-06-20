import 'package:frontend/model/user.dart';

class TeacherDto {
  num? id;
  String? phoneNumber;
  String? idNumber;
  String? speciallizationName;
  String? teacherName;
  num? subjectID;
  User? user;

  TeacherDto({
    this.id,
    this.phoneNumber,
    this.idNumber,
    this.speciallizationName,
    this.teacherName,
    this.subjectID,
    this.user,
  });

  TeacherDto.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    phoneNumber = json['phoneNumber'];
    idNumber = json['idNumber'];
    speciallizationName = json['speciallizationName'];
    teacherName = json['teacherName'];
    if (json['user'] != null) {
      if (json['user'] is Map<String, dynamic>) {
        user = User.fromJson(json['user']);
      } else if (json['user'] is User) {
        user = json['user'];
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id ?? 0;
    data['phoneNumber'] = phoneNumber;
    data['idNumber'] = idNumber ?? 0;
    data['speciallizationName'] = speciallizationName;
    data['teacherName'] = teacherName;
    data['user'] = user;
    return data;
  }
}

class TeacherPaginationResult {
  List<TeacherDto>? data;
  num? count;

  TeacherPaginationResult({this.data, this.count});

  TeacherPaginationResult.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <TeacherDto>[];
      json['data'].forEach((v) {
        data!.add(TeacherDto.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['teacher'] = this.data!.map((v) => v.toJson()).toList();
    data['count'] = count;
    return data;
  }
}

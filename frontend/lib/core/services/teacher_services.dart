import 'package:frontend/core/services/ApiService.dart';
import 'package:frontend/locator.dart';
import 'package:frontend/model/teacher.dart';

class TeacherServices {
  ApiService apiService = locator<ApiService>();
  TeacherServices();

  Future<List<TeacherDto>> getTeachers() async {
    var jsonMap = await apiService.getList(
      "Teacher/GetTeachers",
    );
    List<TeacherDto> result = [];
    for (var item in jsonMap) {
      var teacher = TeacherDto.fromJson(item);
      result.add(teacher);
    }
    return result;
  }

  Future<TeacherDto> getTeacherById(num id) async {
    var jsonMap = await apiService.get("Teacher/GetTeacherById/$id");
    var result = TeacherDto.fromJson(jsonMap);
    return result;
  }

  Future<TeacherDto> addTeacher(TeacherDto child) async {
    var jsonMap = await apiService.post("Teacher/AddTeacher", child.toJson());
    var result = TeacherDto.fromJson(jsonMap);
    return result;
  }

  Future<TeacherDto> updateTeacher(TeacherDto student) async {
    var jsonMap =
        await apiService.put("Teacher/UpdateTeacher", student.toJson());
    var result = TeacherDto.fromJson(jsonMap);
    return result;
  }
}

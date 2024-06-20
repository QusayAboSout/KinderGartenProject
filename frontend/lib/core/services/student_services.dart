import 'package:frontend/core/services/ApiService.dart';
import 'package:frontend/core/services/session.dart';
import 'package:frontend/locator.dart';
import 'package:frontend/model/student_filter.dart';
import 'package:frontend/model/students.dart';

class StudentServices {
  ApiService apiService = locator<ApiService>();
  StudentServices();

  Future<StudentPaginationResult> getStudents(StudentFilter dto) async {
    var jsonMap =
        await apiService.getAllPagination("Student/GetStudents", dto.toJson());
    var result = StudentPaginationResult.fromJson(jsonMap);
    return result;
  }

  Future<List<StudentDto>> getMyStudents() async {
    var jsonMap =
        await apiService.getList("Student/GetMyStudents/${Session.user?.id}");
    List<StudentDto> result = [];
    for (var item in jsonMap) {
      var student = StudentDto.fromJson(item);
      result.add(student);
    }
    return result;
  }
  Future<List<StudentDto>> getClassStudents() async {
    var jsonMap =
        await apiService.getList("Student/GetClassStudents");
    List<StudentDto> result = [];
    for (var item in jsonMap) {
      var student = StudentDto.fromJson(item);
      result.add(student);
    }
    return result;
  }

  Future<StudentDto> addStudent(StudentDto student) async {
    var jsonMap = await apiService.post("Student/AddStudent", student.toJson());
    var result = StudentDto.fromJson(jsonMap);
    return result;
  }

  Future<StudentDto> updateStudent(StudentDto student) async {
    var jsonMap =
        await apiService.put("Student/UpdateStudent", student.toJson());
    var result = StudentDto.fromJson(jsonMap);
    return result;
  }
}

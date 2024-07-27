import 'package:frontend/core/services/ApiService.dart';
import 'package:frontend/locator.dart';
import 'package:frontend/model/student_fees.dart';
import 'package:frontend/model/student_fees_from_query.dart';

class StudentFeesServices {
  ApiService apiService = locator<ApiService>();
  StudentFeesServices();

  Future<List<StudentFeesDto>> getStudentFeess() async {
    var jsonMap =
        await apiService.getList("StudentFees/GetStudentFeess");
    List<StudentFeesDto> result = [];
    for (var item in jsonMap) {
      var subject = StudentFeesDto.fromJson(item);
      result.add(subject);
    }
    return result;
  }

  Future<List<StudentFeesDto>> getStudnetFeesPerClass(num? classID) async {
    var jsonMap =
        await apiService.getList("StudentFees/GetStudentFeesPerClass/{$classID}");
    List<StudentFeesDto> result = [];
    for (var item in jsonMap) {
      var subject = StudentFeesDto.fromJson(item);
      result.add(subject);
    }
    return result;
  }

  Future<List<StudentFeesDto>> getStudentFeesPerClass(
      GetStudentFeesFromQuery obj) async {
    try {
      var jsonMap = await apiService.getList(
          "StudentFees/GetStudentFees",
          params: obj.toJson());
      List<StudentFeesDto> result = [];
      for (var item in jsonMap) {
        var progreses = StudentFeesDto.fromJson(item);
        result.add(progreses);
      }
      return result;
    } catch (e) {
      rethrow;
    }
  }
  Future<StudentFeesDto> addStudentFees(StudentFeesDto child) async {
    var jsonMap =
        await apiService.post("StudentFees/AddStudentFees", child.toJson());
    var result = StudentFeesDto.fromJson(jsonMap);
    return result;
  }

  Future<List<StudentFeesDto>> updateStudentsFees(List<StudentFeesDto> studentFeeses) async {
    var jsonMap =
        await apiService.putListDynamic("StudentFees/UpdateStudentsFees", 
        studentFeeses.map((e) => e.toJson()).toList());
    List<StudentFeesDto> result = [];
    for (var item in jsonMap) {
      result.add(StudentFeesDto.fromJson(item));
    }
    return result;
  }

    Future<bool> deleteStudentFees(num id) async {
    var jsonMap = await apiService.delete('StudentFees/DeleteStudentFees/$id');
    return jsonMap;
  }
  
}

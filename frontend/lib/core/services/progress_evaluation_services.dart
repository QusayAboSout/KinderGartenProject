
import 'package:frontend/core/services/ApiService.dart';
import 'package:frontend/locator.dart';
import 'package:frontend/model/progress_evaluation.dart';
import 'package:frontend/model/progress_evaluation_from_query.dart';

class ProgressEvaluationServices {
  ApiService apiService = locator<ApiService>();
  ProgressEvaluationServices();

  Future<List<ProgressEvaluationDto>> getProgressEvaluations() async {
    var jsonMap =
        await apiService.getList("ProgressEvaluation/GetProgressEvaluations");
    List<ProgressEvaluationDto> result = [];
    for (var item in jsonMap) {
      var progreses = ProgressEvaluationDto.fromJson(item);
      result.add(progreses);
    }
    return result;
  }

  Future<List<ProgressEvaluationDto>> getUnitsMarksForStudent(
      GetUnitsProgressEvaluationForStudents obj) async {
    try {
      var jsonMap = await apiService.getList(
          "ProgressEvaluation/GetUnitsMarksForStudent",
          params: obj.toJson());
      List<ProgressEvaluationDto> result = [];
      for (var item in jsonMap) {
        var progreses = ProgressEvaluationDto.fromJson(item);
        result.add(progreses);
      }
      return result;
    } catch (e) {
      rethrow;
    }
  }

  Future<ProgressEvaluationDto> addProgressEvaluation(
      ProgressEvaluationDto child) async {
    var jsonMap = await apiService.post(
        "ProgressEvaluation/AddProgressEvaluation", child.toJson());
    var result = ProgressEvaluationDto.fromJson(jsonMap);
    return result;
  }

  Future<ProgressEvaluationDto> updateProgressEvaluation(
      ProgressEvaluationDto student) async {
    var jsonMap = await apiService.put(
        "ProgressEvaluation/UpdateProgressEvaluation", student.toJson());
    var result = ProgressEvaluationDto.fromJson(jsonMap);
    return result;
  }

  Future<List<ProgressEvaluationDto>> updateUnitsMarksForStudents(
      List<ProgressEvaluationDto> unitsMarks) async {
    var jsonMap = await apiService.putListDynamic(
        "ProgressEvaluation/UpdateUnitsMarksForStudent",
        unitsMarks.map((e) => e.toJson()).toList());

    List<ProgressEvaluationDto> result = [];
    for (var item in jsonMap) {
      result.add(ProgressEvaluationDto.fromJson(item));
    }
    return result;
  }


  Future<bool> deleteProgressEvaluation(num id) async {
    var jsonMap = await apiService
        .delete('ProgressEvaluation/DeleteProgressEvaluation/$id');
    return jsonMap;
  }
}

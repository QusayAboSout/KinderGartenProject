
import 'package:frontend/core/services/ApiService.dart';
import 'package:frontend/locator.dart';
import 'package:frontend/model/general_evaluation.dart';
import 'package:frontend/model/general_evaluation_final_marks_from_query.dart';
import 'package:frontend/model/general_evaluation_from_query.dart';

class GeneralEvaluationServices {
  ApiService apiService = locator<ApiService>();
  GeneralEvaluationServices();

  Future<List<GeneralEvaluationDto>> getGeneralEvaluations() async {
    var jsonMap =
        await apiService.getList("GeneralEvaluation/GetGeneralEvaluations");
    List<GeneralEvaluationDto> result = [];
    for (var item in jsonMap) {
      var progreses = GeneralEvaluationDto.fromJson(item);
      result.add(progreses);
    }
    return result;
  }

  Future<GeneralEvaluationDto> GetSubjectGrade(
      GetSubjectGeneralEvaluationForStudent child) async {
    var jsonMap = await apiService.get(
        "GeneralEvaluation/GetSubjectGrade", params: child.toJson());
    var result = GeneralEvaluationDto.fromJson(jsonMap);
    return result;
  }

  Future<List<GeneralEvaluationDto>> getStudentFinalMarks(
      GetStudentFinalMarksFromQuery obj) async {
    try {
      var jsonMap = await apiService.getList(
          "GeneralEvaluation/GetStudentFinalMarks",
          params: obj.toJson());
      List<GeneralEvaluationDto> result = [];
      for (var item in jsonMap) {
        var marks = GeneralEvaluationDto.fromJson(item);
        result.add(marks);
      }
      return result;
    } catch (e) {
      rethrow;
    }
  }
  Future<GeneralEvaluationDto> addGeneralEvaluation(
      GeneralEvaluationDto child) async {
    var jsonMap = await apiService.post(
        "GeneralEvaluation/AddGeneralEvaluation", child.toJson());
    var result = GeneralEvaluationDto.fromJson(jsonMap);
    return result;
  }

  Future<List<GeneralEvaluationDto>> updateStudentFinalMarks(
      List<GeneralEvaluationDto> finalMarks) async {
    var jsonMap = await apiService.putListDynamic(
        "GeneralEvaluation/UpdateStudentFinalMarks",
        finalMarks.map((e) => e.toJson()).toList());

    List<GeneralEvaluationDto> result = [];
    for (var item in jsonMap) {
      result.add( GeneralEvaluationDto.fromJson(item));
    }
    return result;
  }

  Future<GeneralEvaluationDto> updateGeneralEvaluation(
      GeneralEvaluationDto student) async {
    var jsonMap = await apiService.put(
        "GeneralEvaluation/UpdateGeneralEvaluation", student.toJson());
    var result = GeneralEvaluationDto.fromJson(jsonMap);
    return result;
  }

  Future<bool> deleteGeneralEvaluation(num id) async {
    var jsonMap = await apiService
        .delete('GeneralEvaluation/DeleteGeneralEvaluation/$id');
    return jsonMap;
  }
}

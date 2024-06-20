import 'package:frontend/core/services/general_evaluation_services.dart';
import 'package:frontend/locator.dart';
import 'package:frontend/model/custom_excetion.dart';
import 'package:frontend/model/general_evaluation.dart';
import 'package:frontend/model/general_evaluation_final_marks_from_query.dart';
import 'package:frontend/model/general_evaluation_from_query.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class GeneralEvaluationController extends GetxController {
  bool loading = false;
  GeneralEvaluationDto GeneralEvaluation = GeneralEvaluationDto();
  final GeneralEvaluationPaginationResult _GeneralEvaluationPaginationResult =
      GeneralEvaluationPaginationResult(data: []);
  List<GeneralEvaluationDto> subjects = [];
  List<GeneralEvaluationDto> marks = [];
  PagingController<int, GeneralEvaluationDto> pagingController =
      PagingController(firstPageKey: 0);
  var service = locator<GeneralEvaluationServices>();
  var error = "";
  String? classID;
  String? studentID;

  @override
  void onInit() async {
    super.onInit();
  }

  Future getGeneralEvaluations() async {
    try {
      loading = true;
      _GeneralEvaluationPaginationResult.data =
          await service.getGeneralEvaluations();
      if (_GeneralEvaluationPaginationResult.data != null) {
        subjects = _GeneralEvaluationPaginationResult.data!;
      }
      loading = false;
      update();
    } on CustomExcetion catch (e) {
      loading = false;
      error = e.apiExcetion.messages!.map((e) => e.messageCode).join(" ,");
      update();
    }
  }

  Future getSubjectGrade(
      String? studentID, String? classID, String? subjectID) async {
    loading = true;
    try {
      GetSubjectGeneralEvaluationForStudent obj =
          GetSubjectGeneralEvaluationForStudent();
      obj.classID = classID;
      obj.studentID = studentID;
      obj.subjectID = subjectID;
      var result = await service.GetSubjectGrade(obj);
      GeneralEvaluation = result;

      loading = false;
      update();
    } on CustomExcetion catch (e) {
      error = e.apiExcetion.messages!.map((e) => e.messageCode).join(" ,");
      loading = false;
      update();
    }
  }

  Future getStudentFinalMarks(String? classID, String? studentID) async {
    try {
      loading = true;
      GetStudentFinalMarksFromQuery obj = GetStudentFinalMarksFromQuery();
      obj.studentID = studentID;
      obj.classID = classID;
      _GeneralEvaluationPaginationResult.data =
          await service.getStudentFinalMarks(obj);
      if (_GeneralEvaluationPaginationResult.data != null) {
        marks = _GeneralEvaluationPaginationResult.data!;
      } else {
        print("لا توجد تقييمات");
      }
      loading = false;
      update();
    } on CustomExcetion catch (e) {
      loading = false;
      error = e.apiExcetion.messages!.map((e) => e.messageCode).join(" ,");
      update();
    }
  }

  Future addGeneralEvaluation(Map<String, dynamic> value) async {
    try {
      var GeneralEvaluation = GeneralEvaluationDto.fromJson(value);
      GeneralEvaluation = await service.addGeneralEvaluation(GeneralEvaluation);
    } on CustomExcetion catch (e) {
      error = e.apiExcetion.messages!.map((e) => e.messageCode).join(" ,");
      update();
    }
    getGeneralEvaluations();
  }

  updateStudentFinalMarks(List<GeneralEvaluationDto> unitsMarks) async {
    var newMarks = await service.updateStudentFinalMarks(unitsMarks);
    refresh();
    update();
  }

  updateGeneralEvaluation(
      GeneralEvaluationDto old, Map<String, dynamic> value) async {
    var std = GeneralEvaluationDto.fromJson(value);
    std.id = old.id;
    std = await service.updateGeneralEvaluation(std);
    refresh();
    update();
    getGeneralEvaluations();
  }

  deleteGeneralEvaluation(num? id) async {
    if (id == null) return;
    var result = await service.deleteGeneralEvaluation(id);
    pagingController.refresh();
    update();
    getGeneralEvaluations();
  }
}

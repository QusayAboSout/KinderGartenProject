import 'package:flutter/material.dart';
import 'package:frontend/core/services/progress_evaluation_services.dart';
import 'package:frontend/core/services/subject_service.dart';
import 'package:frontend/locator.dart';
import 'package:frontend/model/custom_excetion.dart';
import 'package:frontend/model/progress_evaluation.dart';
import 'package:frontend/model/progress_evaluation_from_query.dart';
import 'package:frontend/model/subjects.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ProgressEvaluationController extends GetxController {
  bool loading = false;
  var ProgressEvaluation = ProgressEvaluationDto();
  final ProgressEvaluationPaginationResult _ProgressEvaluationPaginationResult =
      ProgressEvaluationPaginationResult(data: []);
  List<ProgressEvaluationDto> subjects = [];
  List<ProgressEvaluationDto> marks = [];
  PagingController<int, ProgressEvaluationDto> pagingController =
      PagingController(firstPageKey: 0);
  var service = locator<ProgressEvaluationServices>();
  var error = "";

  @override
  void onInit() async {
    super.onInit();
    await getProgressEvaluations();
  }

  Future getProgressEvaluations() async {
    try {
      loading = true;
      _ProgressEvaluationPaginationResult.data =
          await service.getProgressEvaluations();
      if (_ProgressEvaluationPaginationResult.data != null) {
        subjects = _ProgressEvaluationPaginationResult.data!;
      }
      loading = false;
      update();
    } on CustomExcetion catch (e) {
      loading = false;
      error = e.apiExcetion.messages!.map((e) => e.messageCode).join(" ,");
      update();
    }
  }

  Future getUnitsMarksForStudent(String? studentID, String? subjectID) async {
    try {
      loading = true;
      GetUnitsProgressEvaluationForStudents obj =
          GetUnitsProgressEvaluationForStudents();
      obj.studentID = studentID;
      obj.subjectID = subjectID;
      _ProgressEvaluationPaginationResult.data =
          await service.getUnitsMarksForStudent(obj);
      if (_ProgressEvaluationPaginationResult.data != null) {
        marks = _ProgressEvaluationPaginationResult.data!;
      } else {
        return const Text("لا يوجد تقييمات");
      }
      loading = false;
      update();
    } on CustomExcetion catch (e) {
      loading = false;
      error = e.apiExcetion.messages!.map((e) => e.messageCode).join(" ,");
      update();
    }
  }

  Future addProgressEvaluation(Map<String, dynamic> value) async {
    try {
      var ProgressEvaluation = ProgressEvaluationDto.fromJson(value);
      ProgressEvaluation =
          await service.addProgressEvaluation(ProgressEvaluation);
    } on CustomExcetion catch (e) {
      error = e.apiExcetion.messages!.map((e) => e.messageCode).join(" ,");
      update();
    }
    getProgressEvaluations();
  }

  updateProgressEvaluation(
      ProgressEvaluationDto old, Map<String, dynamic> value) async {
    var std = ProgressEvaluationDto.fromJson(value);
    std.id = old.id;
    std = await service.updateProgressEvaluation(std);
    refresh();
    update();
    getProgressEvaluations();
  }

  updateUnitsMarksForStudent(
    List<ProgressEvaluationDto> unitsMarks) async {
    var newMarks = await service.updateUnitsMarksForStudents(unitsMarks);
    refresh();
    update();
  }

  deleteProgressEvaluation(num? id) async {
    if (id == null) return;
    var result = await service.deleteProgressEvaluation(id);
    pagingController.refresh();
    update();
    getProgressEvaluations();
  }

}

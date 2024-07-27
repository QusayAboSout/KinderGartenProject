import 'package:flutter/material.dart';
import 'package:frontend/core/services/student_fees_service.dart';
import 'package:frontend/locator.dart';
import 'package:frontend/model/custom_excetion.dart';
import 'package:frontend/model/student_fees.dart';
import 'package:frontend/model/student_fees_from_query.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class StudentFeesController extends GetxController {
  bool loading = false;
  var StudentFees = StudentFeesDto();
  final StudentFeesPaginationResult _StudentFeesPaginationResult =
      StudentFeesPaginationResult(data: []);
  List<StudentFeesDto> subjects = [];
  List<StudentFeesDto> marks = [];
  PagingController<int, StudentFeesDto> pagingController =
      PagingController(firstPageKey: 0);
  var service = locator<StudentFeesServices>();
  var error = "";


  Future getStudentFeess() async {
    try {
      loading = true;
      _StudentFeesPaginationResult.data =
          await service.getStudentFeess();
      if (_StudentFeesPaginationResult.data != null) {
        subjects = _StudentFeesPaginationResult.data!;
      }
      loading = false;
      update();
    } on CustomExcetion catch (e) {
      loading = false;
      error = e.apiExcetion.messages!.map((e) => e.messageCode).join(" ,");
      update();
    }
  }

  Future get(String? studentID, String? classID) async {
    try {
      loading = true;
      GetStudentFeesFromQuery obj =
          GetStudentFeesFromQuery();
      obj.studentID = studentID;
      obj.classID = classID;
      _StudentFeesPaginationResult.data =
          await service.getStudentFeesPerClass(obj);
      if (_StudentFeesPaginationResult.data != null) {
        marks = _StudentFeesPaginationResult.data!;
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

  Future addStudentFees(Map<String, dynamic> value) async {
    try {
      var StudentFees = StudentFeesDto.fromJson(value);
      StudentFees =
          await service.addStudentFees(StudentFees);
    } on CustomExcetion catch (e) {
      error = e.apiExcetion.messages!.map((e) => e.messageCode).join(" ,");
      update();
    }
    getStudentFeess();
  }


  updateUnitsMarksForStudent(
    List<StudentFeesDto> unitsMarks) async {
    var newMarks = await service.updateStudentsFees(unitsMarks);
    refresh();
    update();
  }

  deleteStudentFees(num? id) async {
    if (id == null) return;
    var result = await service.deleteStudentFees(id);
    pagingController.refresh();
    update();
    getStudentFeess();
  }

}

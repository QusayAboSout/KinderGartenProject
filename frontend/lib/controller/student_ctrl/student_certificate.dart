import 'package:frontend/core/services/general_evaluation_services.dart';
import 'package:frontend/core/services/progress_evaluation_services.dart';
import 'package:frontend/core/services/student_services.dart';
import 'package:frontend/locator.dart';
import 'package:frontend/model/general_evaluation.dart';
import 'package:frontend/model/general_evaluation_final_marks_from_query.dart';
import 'package:frontend/model/progress_evaluation.dart';
import 'package:frontend/model/progress_evaluation_from_query.dart';
import 'package:frontend/model/student_filter.dart';
import 'package:frontend/model/students.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class StudentCertificateController extends GetxController {
  StudentCertificateController();

  bool loading = false;

  bool showProgress = false;
  var service = locator<StudentServices>();
  var generalEvaluation = locator<GeneralEvaluationServices>();
  var progressEvalution = locator<ProgressEvaluationServices>();
  late StudentDto student;

  GetStudentFinalMarksFromQuery finalMarksObj = GetStudentFinalMarksFromQuery();
  List<GeneralEvaluationDto> finalMarks = [];

  GetUnitsProgressEvaluationForStudents unitsMarksObj =
      GetUnitsProgressEvaluationForStudents();
  List<ProgressEvaluationDto> unitsMarks = [];

  StudentFilter getDto = StudentFilter();

  PagingController<int, StudentDto> pagingController = PagingController(
    firstPageKey: 0,
  );

  void fetchFinalMarks() async {
    finalMarksObj.classID = student.classID.toString();
    finalMarksObj.studentID = student.id.toString();
    finalMarks = await generalEvaluation.getStudentFinalMarks(finalMarksObj);
    update();
    showProgress = false;
  }

  void fetchUnitsMarks(num? subjectID) async {
    unitsMarksObj.subjectID = subjectID.toString();
    unitsMarksObj.studentID = student.id.toString();
    unitsMarks = await progressEvalution.getUnitsMarksForStudent(unitsMarksObj);
    update();
    showProgress = false;
  }
}

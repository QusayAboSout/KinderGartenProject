import 'package:frontend/core/services/class_service.dart';
import 'package:frontend/core/services/session.dart';
import 'package:frontend/core/services/student_services.dart';
import 'package:frontend/core/services/subject_service.dart';
import 'package:frontend/core/services/unit_services.dart';
import 'package:frontend/locator.dart';
import 'package:frontend/model/class.dart';
import 'package:frontend/model/custom_excetion.dart';
import 'package:frontend/model/students.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class MyClassStudentsController extends GetxController {
  MyClassStudentsController();
  bool progress = false;
  bool isHave = false;
  var error = "";
  var service = locator<StudentServices>();
  var classService = locator<ClassServices>();

  List<StudentDto> students = [];

  Future getMyClassStudents() async {
    try {
      var result = await service.getClassStudents();
      students = result;
      update();
    } on CustomExcetion catch (e) {
      progress = false;
      error = e.apiExcetion.messages!.map((e) => e.messageCode).join(" ,");
      update();
    }
  }

  Future<void> isHaveClass() async {
    ClassDto? clas = await classService.getTeacherClass(Session.user?.id);
    if (clas?.teacherID == null) {
      isHave = false;
    } else {
      isHave = true;
    }
  }
}

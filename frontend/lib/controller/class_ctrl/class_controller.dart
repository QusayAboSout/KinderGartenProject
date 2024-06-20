import 'package:frontend/controller/class_ctrl/class_subjects_controller.dart';
import 'package:frontend/core/services/class_service.dart';
import 'package:frontend/core/services/session.dart';
import 'package:frontend/core/services/student_services.dart';
import 'package:frontend/core/services/teacher_services.dart';
import 'package:frontend/core/services/user_services.dart';
import 'package:frontend/locator.dart';
import 'package:frontend/model/class.dart';
import 'package:frontend/model/custom_excetion.dart';
import 'package:frontend/model/student_filter.dart';
import 'package:frontend/model/students.dart';
import 'package:frontend/model/teacher.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ClassController extends GetxController {
  bool loading = false;
  bool showProgress = false;
  var claas = ClassDto();
  final ClassPaginationResult _ClassPaginationResult =
      ClassPaginationResult(data: []);
  PagingController<int, ClassDto> pagingController =
      PagingController(firstPageKey: 0);
  List<ClassDto> clacess = [];
  RxInt selectedIndex = 0.obs;

  late StudentPaginationResult _studentPaginationResult =
      StudentPaginationResult(data: []);
  StudentFilter dto = StudentFilter();
  List<StudentDto>? students = [];

  late final TeacherPaginationResult _teacherPaginationResult =
      TeacherPaginationResult(data: []);
  List<TeacherDto>? teachers = [];
  var teacher = TeacherDto();

  final ClassSubjectsController classSubjectsController =
      Get.find<ClassSubjectsController>();

  var service = locator<ClassServices>();
  var stdService = locator<StudentServices>();
  var teacherService = locator<TeacherServices>();
  var userService = locator<UserServices>();

  var error = "";
  num? classID;
  @override
  void onInit() async {
    super.onInit();
    await getClasss();
  }

  void setSelectedIndex(int index) {
    selectedIndex.value = index;
  }

  Future getClasss() async {
    try {
      loading = true;
      _ClassPaginationResult.data = await service.getClasss();
      if (_ClassPaginationResult.data != null) {
        clacess = _ClassPaginationResult.data!;
      }
      loading = false;
      update();
    } on CustomExcetion catch (e) {
      loading = false;
      error = e.apiExcetion.messages!.map((e) => e.messageCode).join(" ,");
      update();
    }
    loading = false;
  }

  Future addClass(Map<String, dynamic> value) async {
    try {
      var clas = ClassDto.fromJson(value);
      clas = await service.addClass(clas);
      pagingController.refresh();
    } on CustomExcetion catch (e) {
      error = e.apiExcetion.messages!.map((e) => e.messageCode).join(" ,");
      update();
    }
    getClasss();
  }

  updateClass(ClassDto old, Map<String, dynamic> value) async {
    var clas = ClassDto.fromJson(value);
    clas.id = old.id;

    clas = await service.updateClass(clas);
    pagingController.refresh();
    Get.back();
    update();
    getClasss();
  }

  deleteClass(num? id) async {
    if (id == null) return;
    var result = await service.deleteClass(id);
    pagingController.refresh();
    Get.back();
    update();
    getClasss();
  }

  //////////////////////////////////////////////////////////////

  getStudentOfTheClass(num classID) async {
    loading = true;
    dto.classID = classID;
    _studentPaginationResult = await stdService.getStudents(dto);
    students = _studentPaginationResult.data;
    update();
    loading = false;
  }

  getCurrentStudent(num? classID) async {
    loading = true;
    dto.classID = classID;
    _studentPaginationResult = await stdService.getStudents(dto);
    students = _studentPaginationResult.data;
    loading = false;
    return students;
  }

  //////////////////////////////////////////////////////////////

  Future getClassTeacher(ClassDto classDto) async {
    try {
      loading = true;
      if (classDto.teacherID == null) {
        teacher = TeacherDto(teacherName: null);
      } else {
        teacher = await teacherService.getTeacherById(
          classDto.teacherID!,
        );
      }
      loading = false;
    } on CustomExcetion catch (e) {
      loading = false;
      error = e.apiExcetion.messages!.map((e) => e.messageCode).join(" ,");
    }
  }

  //////////////////////////////////////////////////////////////

  Future getTeacherClassInfo(num? teacherID) async {
    try {
      loading = true;
      clacess = await service.getClasss();
      for (int i = 0; i < clacess.length; i++) {
        if (clacess[i].teacherID == teacherID) {
          claas = clacess[i];
          update();
          return;
        }
      }
      claas = ClassDto();
      loading = false;
      update();
    } on CustomExcetion catch (e) {
      loading = false;
      error = e.apiExcetion.messages!.map((e) => e.messageCode).join(" ,");
      update();
    }
  }

  //////////////////////////////////////////////////////////////////
  Future getTeacherClass() async {
    showProgress = true;
    update(['progress']);
    var result = await service.getTeacherClass(Session.user?.id);
    if (result != null) {
      claas = result;
      update(['teacherName']);
      return;
    } else {
      claas = ClassDto();
      update(['teacherName']);
    }

    showProgress = false;
    update(['progress']);
  }

  /////////////////////////////////////////////////////////////
  // Future<void> getStudentOfTheClass(num? userID) async{

  // }
}

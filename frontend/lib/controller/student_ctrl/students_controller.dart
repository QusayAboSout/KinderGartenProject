import 'package:frontend/core/services/child_card_services.dart';
import 'package:frontend/core/services/class_service.dart';
import 'package:frontend/core/services/student_services.dart';
import 'package:frontend/locator.dart';
import 'package:frontend/model/childCardDto.dart';
import 'package:frontend/model/custom_excetion.dart';
import 'package:frontend/model/student_filter.dart';
import 'package:frontend/model/students.dart';
import 'package:frontend/utils/global.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class StudentController extends GetxController {
  StudentController();

  bool loading = false;
  bool showProgress = false;
  bool haveBirth = false;
  var error = "";
  var service = locator<StudentServices>();
  var childCardServices = locator<ChildCardServices>();
  var classService = locator<ClassServices>();
  var childCardService = locator<ChildCardServices>();

  ChildCardDto childCardDto = ChildCardDto();
  // var service = locator<>();
  StudentFilter getDto = StudentFilter();
  PagingController<int, StudentDto> pagingController =
      PagingController(firstPageKey: 0);
  var studentClass;

  num? classID;
  @override
  void onInit() async {
    super.onInit();
    getDto = StudentFilter(classID: classID);
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      // ignore: unused_local_variable
      bool loading = true;
      getDto.sortOrder = "desc";
      getDto.sortField = "ID";
      getDto.skipCount = pageKey;
      getDto.maxResultCount = Global.pageSize;
      getDto.classID = classID;
      var newItems = await service.getStudents(getDto);
      if (newItems.data == null) return;
      final isLastPage = newItems.data!.length < Global.pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(newItems.data!);
      } else {
        final nextPageKey = pageKey + newItems.data!.length;
        pagingController.appendPage(newItems.data!, nextPageKey);
      }
      loading = false;
    } catch (error) {
      loading = false;
      pagingController.error = error;
    }
  }

  Future getMyStudents() async {
    try {
      loading = true;
      // = await service.getMyStudents();
      // var gurdian = await
      var newItems = await service.getMyStudents();
      final isLastPage = newItems.length < Global.pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = 10 + newItems.length;
        pagingController.appendPage(newItems, nextPageKey);
      }
      loading = false;
      update();
    } on CustomExcetion catch (e) {
      loading = false;
      error = e.apiExcetion.messages!.map((e) => e.messageCode).join(" ,");
      update();
    }
  }

  Future addStudent(ChildCardDto? card, Map<String, dynamic> value) async {
    try {
      var student = StudentDto.fromJson(value);
      student.userID = card?.userID;
      student.childCardID = card?.id;
      await service.addStudent(student);
    } on CustomExcetion catch (e) {
      error = e.apiExcetion.messages!.map((e) => e.messageCode).join(" ,");
      refresh();
      update();
    }
  }

  updateStudent(StudentDto old, Map<String, dynamic> value) async {
    var std = StudentDto.fromJson(value);
    std.id = old.id;

    std = await service.updateStudent(std);
    pagingController.refresh();
    Get.back();
    update();
  }

  Future getMyStudentClass(StudentDto student) async {
    var result = await classService.getClassById(student.classID!);
    studentClass = result.className;
    update();
  }

  Future getChildCardOfStudent(num cardID) async {
    showProgress = true;
    update(['progress']);

    childCardDto = await childCardServices.getChildCard(cardID);
    if (childCardDto.birthOfDate != null) {
      haveBirth = true;
      update(['age']);
    }
    showProgress = false;
    update(['progress']);
  }
}

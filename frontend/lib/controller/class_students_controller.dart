import 'package:frontend/core/services/student_services.dart';
import 'package:frontend/locator.dart';
import 'package:frontend/model/custom_excetion.dart';
import 'package:frontend/model/student_filter.dart';
import 'package:frontend/model/students.dart';
import 'package:frontend/utils/global.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ClassStudentController extends GetxController {
  ClassStudentController();

  bool loading = false;
  var error = "";
  var service = locator<StudentServices>();
  StudentFilter getDto = StudentFilter();
  PagingController<int, StudentDto> pagingController =
      PagingController(firstPageKey: 0);

  num? classID;
  @override
  void onInit() async {
    super.onInit();
    getDto = StudentFilter(classID: classID);
    // getDto.date = DateTime.now();
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

  Future addStudent(num? id, Map<String, dynamic> value) async {
    try {
      var student = StudentDto.fromJson(value);
      student = await service.addStudent(student);
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
}

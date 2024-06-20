import 'package:frontend/controller/class_ctrl/class_controller.dart';
import 'package:frontend/core/services/class_service.dart';
import 'package:frontend/core/services/student_services.dart';
import 'package:frontend/locator.dart';
import 'package:frontend/model/class.dart';
import 'package:frontend/model/custom_excetion.dart';
import 'package:frontend/model/student_filter.dart';
import 'package:frontend/model/students.dart';
import 'package:frontend/utils/global.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CurrentStudentController extends GetxController {
  CurrentStudentController();

  bool loading = false;
  var error = "";
  var service = locator<StudentServices>();
  var class_service = locator<ClassServices>();
  StudentFilter getDto = StudentFilter();
  PagingController<int, StudentDto> pagingController = PagingController(
    firstPageKey: 0,
  );
  final ClassPaginationResult _clacess = ClassPaginationResult(
    data: [],
  );
  ClassController classController = Get.find<ClassController>();

  @override
  void onInit() async {
    super.onInit();
    getDto = StudentFilter();
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
      var newItems = await service.getStudents(getDto);
      if (newItems.data == null) return;

      _clacess.data = await class_service.getClasss();
      for (var i = 0; i < _clacess.data!.length; i++) {
        if (_clacess.data![i].classYear != DateTime.now().year) {
          List<num?> classIDs = [];
          classIDs.add(_clacess.data![i].id);
          newItems.data!.removeWhere(
            (element) => classIDs.contains(
              element.classID,
            ),
          );
        }
      }

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
}


import 'package:frontend/core/services/class_service.dart';
import 'package:frontend/core/services/class_subjects_services.dart';
import 'package:frontend/locator.dart';
import 'package:frontend/model/class.dart';
import 'package:frontend/model/class_subjects.dart';
import 'package:frontend/model/custom_excetion.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ClassSubjectsController extends GetxController {
  bool loading = false;
  ClassDto? claas;

  PagingController<int, ClassSubjectsDto> pagingController =
      PagingController(firstPageKey: 0);
  List<ClassSubjectsDto> classSubjectsDtos = [];
  RxInt selectedIndex = 0.obs;

  var service = locator<ClassSubjectsServices>();
  var error = "";

  void setSelectedIndex(int index) {
    selectedIndex.value = index;
  }

  Future getClassSubjectss() async {
    try {
      loading = true;
      classSubjectsDtos = await service.getClasssSubjects(claas!.id!);
      loading = false;
      update();
    } on CustomExcetion catch (e) {
      loading = false;
      error = e.apiExcetion.messages!.map((e) => e.messageCode).join(" ,");
      update();
    }
  }

  Future addClassSubjects(Map<String, dynamic> value) async {
    try {
      var clas = ClassSubjectsDto.fromJson(value);
      clas = await service.addClassSubjects(clas);
      pagingController.refresh();
    } on CustomExcetion catch (e) {
      error = e.apiExcetion.messages!.map((e) => e.messageCode).join(" ,");
      update();
    }
    getClassSubjectss();
  }

  updateClassSubjects(ClassSubjectsDto old, Map<String, dynamic> value) async {
    var clas = ClassSubjectsDto.fromJson(value);
    clas.id = old.id;

    clas = await service.updateClassSubjects(clas);
    pagingController.refresh();
    Get.back();
    update();
  }

  deleteClassSubjects(num? id) async {
    if (id == null) return;
    var result = await service.deleteClassSubjects(id);
    getClassSubjectss();
  }
}

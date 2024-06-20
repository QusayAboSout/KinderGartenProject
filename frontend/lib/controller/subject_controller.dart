import 'package:frontend/controller/unit_controller.dart';
import 'package:frontend/core/services/subject_service.dart';
import 'package:frontend/core/services/unit_services.dart';
import 'package:frontend/locator.dart';
import 'package:frontend/model/custom_excetion.dart';
import 'package:frontend/model/subjects.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class SubjectController extends GetxController {
  bool loading = false;
  var Subject = SubjectDto();
  final SubjectPaginationResult _SubjectPaginationResult =
      SubjectPaginationResult(data: []);
  List<SubjectDto> subjects = [];
  PagingController<int, SubjectDto> pagingController =
      PagingController(firstPageKey: 0);
  var service = locator<SubjectServices>();
  var unitService = locator<UnitServices>();
  var error = "";
  var units = [];

  @override
  void onInit() async {
    super.onInit();
    await getSubjects();
  }

  Future getSubjects() async {
    try {
      loading = true;
      _SubjectPaginationResult.data = await service.getSubjects();
      if (_SubjectPaginationResult.data != null) {
        subjects = _SubjectPaginationResult.data!;
      }
      loading = false;
      update();
    } on CustomExcetion catch (e) {
      loading = false;
      error = e.apiExcetion.messages!.map((e) => e.messageCode).join(" ,");
      update();
    }
  }

  Future addSubject(Map<String, dynamic> value) async {
    try {
      var Subject = SubjectDto.fromJson(value);
      Subject = await service.addSubject(Subject);
    } on CustomExcetion catch (e) {
      error = e.apiExcetion.messages!.map((e) => e.messageCode).join(" ,");
      update();
    }
    getSubjects();
  }

  deleteSubject(num? id) async {
    if (id == null) return;
    var result = await service.deleteSubject(id);
    pagingController.refresh();
    update();
    getSubjects();
  }

  Future getUnitsSubject(num? subjectID) async {
    try {
      loading = true;
      units = await unitService.getUnitsSubject(subjectID);
      loading = false;
      update();
      refresh();
      return;
    } on CustomExcetion catch (e) {
      loading = false;
      error = e.apiExcetion.messages!.map((e) => e.messageCode).join(" ,");
      update();
    }
  }

  updateSubject(SubjectDto old, Map<String, dynamic> value) async {
    var std = SubjectDto.fromJson(value);
    std.id = old.id;
    std = await service.updateSubject(std);
    refresh();
    update();
    getSubjects();
  }
}

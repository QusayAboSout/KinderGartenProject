import 'package:frontend/core/services/section_services.dart';
import 'package:frontend/core/services/unit_services.dart';
import 'package:frontend/locator.dart';
import 'package:frontend/model/custom_excetion.dart';
import 'package:frontend/model/section.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class SectionController extends GetxController {
  bool loading = false;
  var Section = SectionDto();
  num? classID;
  final SectionPaginationResult _SectionPaginationResult =
      SectionPaginationResult(data: []);
  List<SectionDto> Sections = [];
  PagingController<int, SectionDto> pagingController =
      PagingController(firstPageKey: 0);
  var service = locator<SectionServices>();
  var unitService = locator<UnitServices>();
  var error = "";

  @override
  void onInit() async {
    super.onInit();
    await getClassSections(classID);
  }

  Future getClassSections(num? classID) async {
    try {
      loading = true;
      _SectionPaginationResult.data = await service.getSections(classID);
      if (_SectionPaginationResult.data != null) {
        Sections = _SectionPaginationResult.data!;
      }
      loading = false;
      update();
    } on CustomExcetion catch (e) {
      loading = false;
      error = e.apiExcetion.messages!.map((e) => e.messageCode).join(" ,");
      update();
    }
  }

  Future addSection(Map<String, dynamic> value) async {
    try {
      var Section = SectionDto.fromJson(value);
      Section = await service.addSection(Section);
    } on CustomExcetion catch (e) {
      error = e.apiExcetion.messages!.map((e) => e.messageCode).join(" ,");
      update();
    }
  }

  deleteSection(num? id) async {
    if (id == null) return;
    var result = await service.deleteSection(id);
    pagingController.refresh();
    update();
  }

  updateSection(SectionDto old, Map<String, dynamic> value) async {
    var std = SectionDto.fromJson(value);
    std.id = old.id;
    std = await service.updateSection(std);
    refresh();
    update();
  }
}

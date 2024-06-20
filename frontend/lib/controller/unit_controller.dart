import 'package:frontend/core/services/unit_services.dart';
import 'package:frontend/locator.dart';
import 'package:frontend/model/custom_excetion.dart';
import 'package:get/get.dart';

import '../model/unit.dart';

class UnitController extends GetxController {
  bool loading = false;
  var Unit = UnitDto();
  final UnitPaginationResult _UnitPaginationResult =
      UnitPaginationResult(data: []);
  List<UnitDto> units = [];
  List<UnitDto> subjectUnits = [];
  var service = locator<UnitServices>();
  var error = "";
  num? subjectID;
  @override
  void onInit() async {
    super.onInit();
    await getUnits();
  }

  Future getUnits() async {
    try {
      loading = true;
      _UnitPaginationResult.data = await service.getUnits();
      if (_UnitPaginationResult.data != null) {
        units = _UnitPaginationResult.data!;
      }
      loading = false;
      update();
    } on CustomExcetion catch (e) {
      loading = false;
      error = e.apiExcetion.messages!.map((e) => e.messageCode).join(" ,");
      update();
    }
  }

  Future getUnitsSubject(num? subjectID) async {
    try {
      loading = true;
      _UnitPaginationResult.data = await service.getUnitsSubject(subjectID);
      if (_UnitPaginationResult.data != null) {
        subjectUnits = _UnitPaginationResult.data!;
      }
      loading = false;
      update();
    } on CustomExcetion catch (e) {
      loading = false;
      error = e.apiExcetion.messages!.map((e) => e.messageCode).join(" ,");
      update();
    }
  }

  Future addUnit(Map<String, dynamic> value, num? subjID) async {
    try {
      var Unit = UnitDto.fromJson(value);
      Unit.subjectID = subjID;
      Unit = await service.addUnit(Unit);
    } on CustomExcetion catch (e) {
      error = e.apiExcetion.messages!.map((e) => e.messageCode).join(" ,");
      update();
    }
    getUnits();
  }

  Future updateUnit(UnitDto old, Map<String, dynamic> value) async {
    var std = UnitDto.fromJson(value);
    std.id = old.id;

    std = await service.updateUnit(std);
    refresh();
    Get.back();
    update();
    getUnits();
  }

  deleteUnit(num? id) async {
    if (id == null) return;
    var result = await service.deleteUnit(id);
    refresh();
    update();
  }
}

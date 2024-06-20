import 'package:frontend/core/services/ApiService.dart';
import 'package:frontend/locator.dart';
import 'package:frontend/model/unit.dart';

class UnitServices {
  ApiService apiService = locator<ApiService>();
  UnitServices();

  Future<List<UnitDto>> getUnits() async {
    var jsonMap = await apiService.getList(
      "Unit/GetUnits",
    );
    List<UnitDto> result = [];
    for (var item in jsonMap) {
      var subject = UnitDto.fromJson(item);
      result.add(subject);
    }
    return result;
  }

  Future<List<UnitDto>> getUnitsSubject(num? subjectID) async {
    var jsonMap = await apiService.getList("Unit/GetUnitsSubject/$subjectID");
    List<UnitDto> result = [];
    for (var item in jsonMap) {
      var unit = UnitDto.fromJson(item);
      result.add(unit);
    }
    return result;
  }

  Future<UnitDto> addUnit(UnitDto child) async {
    var jsonMap = await apiService.post("Unit/AddUnit", child.toJson());
    var result = UnitDto.fromJson(jsonMap);
    return result;
  }

  Future<UnitDto> updateUnit(UnitDto student) async {
    var jsonMap = await apiService.put("Unit/UpdateUnit", student.toJson());
    var result = UnitDto.fromJson(jsonMap);
    return result;
  }

    Future<bool> deleteUnit(num id) async {
    var jsonMap = await apiService.delete('Unit/DeleteUnit/$id');
    return jsonMap;
  }
}

import 'package:frontend/core/services/ApiService.dart';
import 'package:frontend/locator.dart';
import 'package:frontend/model/class.dart';

class ClassServices {
  ApiService apiService = locator<ApiService>();
  ClassServices();

  Future<List<ClassDto>> getClasss() async {
    var jsonMap = await apiService.getList("Class/GetClasss");
    List<ClassDto> result = [];
    for (var item in jsonMap) {
      var childCard = ClassDto.fromJson(item);
      result.add(childCard);
    }
    return result;
  }

  Future<ClassDto?> getTeacherClass(num? id) async {
    var jsonMap = await apiService.get("Class/GetTeacherClass/$id");
    var result = ClassDto.fromJson(jsonMap);
    return result;
  }

  Future<ClassDto> getClassById(num id) async {
    var jsonMap = await apiService.get("Class/GetClassById/$id");
    var result = ClassDto.fromJson(jsonMap);
    return result;
  }

  Future<ClassDto> addClass(ClassDto child) async {
    var jsonMap = await apiService.post("Class/AddClass", child.toJson());
    var result = ClassDto.fromJson(jsonMap);
    return result;
  }

  Future<ClassDto> updateClass(ClassDto clas) async {
    var jsonMap = await apiService.put("Class/UpdateClass", clas.toJson());
    var result = ClassDto.fromJson(jsonMap);
    return result;
  }

  Future<bool> deleteClass(num id) async {
    var jsonMap = await apiService.delete('Class/DeleteClass/$id');
    return jsonMap;
  }
}

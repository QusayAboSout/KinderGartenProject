import 'package:frontend/core/services/ApiService.dart';
import 'package:frontend/locator.dart';
import 'package:frontend/model/class_subjects.dart';

class ClassSubjectsServices {
  ApiService apiService = locator<ApiService>();
  ClassSubjectsServices();

  Future<List<ClassSubjectsDto>> getClasssSubjects(num classID) async {
    var jsonMap = await apiService.getList("ClassSubjects/GetClassSubjects",
        params: {"ClassID": classID.toString()});
    List<ClassSubjectsDto> result = [];
    for (var item in jsonMap) {
      var classSubject = ClassSubjectsDto.fromJson(item);
      result.add(classSubject);
    }
    return result;
  }

  Future<ClassSubjectsDto> addClassSubjects(ClassSubjectsDto child) async {
    var jsonMap =
        await apiService.post("ClassSubjects/AddClassSubjects", child.toJson());
    var result = ClassSubjectsDto.fromJson(jsonMap);
    return result;
  }

  Future<ClassSubjectsDto> updateClassSubjects(ClassSubjectsDto clas) async {
    var jsonMap = await apiService.put(
        "ClassSubjects/UpdateClassSubjects", clas.toJson());
    var result = ClassSubjectsDto.fromJson(jsonMap);
    return result;
  }

  Future<bool> deleteClassSubjects(num id) async {
    var jsonMap =
        await apiService.delete('ClassSubjects/DeleteClassSubjects/$id');
    return jsonMap;
  }
}

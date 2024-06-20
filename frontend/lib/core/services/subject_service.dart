import 'package:frontend/core/services/ApiService.dart';
import 'package:frontend/locator.dart';
import 'package:frontend/model/subjects.dart';

class SubjectServices {
  ApiService apiService = locator<ApiService>();
  SubjectServices();

  Future<List<SubjectDto>> getSubjects() async {
    var jsonMap =
        await apiService.getList("Subject/GetSubjects");
    List<SubjectDto> result = [];
    for (var item in jsonMap) {
      var subject = SubjectDto.fromJson(item);
      result.add(subject);
    }
    return result;
  }

  Future<SubjectDto> addSubject(SubjectDto child) async {
    var jsonMap =
        await apiService.post("Subject/AddSubject", child.toJson());
    var result = SubjectDto.fromJson(jsonMap);
    return result;
  }

  Future<SubjectDto> updateSubject(SubjectDto student) async {
    var jsonMap =
        await apiService.put("Subject/UpdateSubject", student.toJson());
    var result = SubjectDto.fromJson(jsonMap);
    return result;
  }

    Future<bool> deleteSubject(num id) async {
    var jsonMap = await apiService.delete('Subject/DeleteSubject/$id');
    return jsonMap;
  }
  
}

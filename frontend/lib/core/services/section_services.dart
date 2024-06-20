import 'package:frontend/core/services/ApiService.dart';
import 'package:frontend/locator.dart';
import 'package:frontend/model/section.dart';

class SectionServices {
  ApiService apiService = locator<ApiService>();
  SectionServices();

  Future<List<SectionDto>> getSections(num? classID) async {
    var jsonMap = await apiService.getList("Section/GetClassSections/$classID");
    List<SectionDto> result = [];
    for (var item in jsonMap) {
      var Section = SectionDto.fromJson(item);
      result.add(Section);
    }
    return result;
  }

  Future<SectionDto> addSection(SectionDto child) async {
    var jsonMap = await apiService.post("Section/AddSection", child.toJson());
    var result = SectionDto.fromJson(jsonMap);
    return result;
  }

  Future<SectionDto> updateSection(SectionDto student) async {
    var jsonMap =
        await apiService.put("Section/UpdateSection", student.toJson());
    var result = SectionDto.fromJson(jsonMap);
    return result;
  }

  Future<bool> deleteSection(num id) async {
    var jsonMap = await apiService.delete('Section/DeleteSection/$id');
    return jsonMap;
  }
}

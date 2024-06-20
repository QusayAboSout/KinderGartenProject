import 'package:frontend/core/services/ApiService.dart';
import 'package:frontend/locator.dart';
import 'package:frontend/model/gurdian.dart';
import 'package:frontend/model/teacher.dart';

class GuardianServices {
  ApiService apiService = locator<ApiService>();
  GuardianServices();

  Future<List<GuardianDto>> getGuardians() async {
    var jsonMap = await apiService.getList(
      "Guardian/GetGuardians",
    );
    List<GuardianDto> result = [];
    for (var item in jsonMap) {
      var teacher = GuardianDto.fromJson(item);
      result.add(teacher);
    }
    return result;
  }

  Future<GuardianDto> getGuardianById(num id) async {
    var jsonMap = await apiService.get("Guardian/GetGuardianById/$id");
    var result = GuardianDto.fromJson(jsonMap);
    return result;
  }

  Future<GuardianDto> addGuardian(GuardianDto child) async {
    var jsonMap = await apiService.post("Guardian/AddGuardian", child.toJson());
    var result = GuardianDto.fromJson(jsonMap);
    return result;
  }

  Future<GuardianDto> updateGuardian(GuardianDto student) async {
    var jsonMap =
        await apiService.put("Guardian/UpdateGuardian", student.toJson());
    var result = GuardianDto.fromJson(jsonMap);
    return result;
  }
  Future<bool> deleteGuardian(num id) async {
    var jsonMap = await apiService.delete('Guardian/DeleteGuardian/$id');
    return jsonMap;
  }
}

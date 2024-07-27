import 'package:frontend/core/services/ApiService.dart';
import 'package:frontend/locator.dart';
import 'package:frontend/model/registration_fees.dart';

class RegistrationFeesServices {
  ApiService apiService = locator<ApiService>();
  RegistrationFeesServices();

  Future<List<RegistrationFeesDto>> getRegistrationFeess() async {
    var jsonMap =
        await apiService.getList("RegistrationFees/GetRegistrationFeess");
    List<RegistrationFeesDto> result = [];
    for (var item in jsonMap) {
      var subject = RegistrationFeesDto.fromJson(item);
      result.add(subject);
    }
    return result;
  }

  Future<RegistrationFeesDto> getRegistrationFeesById(num id) async {
    var jsonMap = await apiService.get("RegistrationFees/GetRegistrationFeesById/$id");
    var result = RegistrationFeesDto.fromJson(jsonMap);
    return result;
  }

  Future<RegistrationFeesDto> addRegistrationFees(RegistrationFeesDto child) async {
    var jsonMap =
        await apiService.post("RegistrationFees/AddRegistrationFees", child.toJson());
    var result = RegistrationFeesDto.fromJson(jsonMap);
    return result;
  }

  Future<RegistrationFeesDto> updateRegistrationFees(RegistrationFeesDto student) async {
    var jsonMap =
        await apiService.put("RegistrationFees/UpdateRegistrationFees", student.toJson());
    var result = RegistrationFeesDto.fromJson(jsonMap);
    return result;
  }

    Future<bool> deleteRegistrationFees(num id) async {
    var jsonMap = await apiService.delete('RegistrationFees/DeleteRegistrationFees/$id');
    return jsonMap;
  }
  
}

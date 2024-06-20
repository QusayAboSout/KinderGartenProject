import 'package:frontend/core/services/ApiService.dart';
import 'package:frontend/locator.dart';
import 'package:frontend/model/childCardDto.dart';

class ChildCardServices {
  ApiService apiService = locator<ApiService>();
  ChildCardServices();

  Future<List<ChildCardDto>> getChildCards() async {
    var jsonMap = await apiService.getList("ChildCard/GetChildCards");
    List<ChildCardDto> result = [];
    for (var item in jsonMap) {
      var childCard = ChildCardDto.fromJson(item);
      result.add(childCard);
    }
    return result;
  }

  Future<List<ChildCardDto>> getChildCardsByUser() async {
    var jsonMap = await apiService.getList("ChildCard/GetChildCardsByUser");
    List<ChildCardDto> result = [];
    for (var item in jsonMap) {
      var childCard = ChildCardDto.fromJson(item);
      result.add(childCard);
    }
    return result;
  }
  Future<List<ChildCardDto>> getChildCardsStatusByUser() async {
    var jsonMap = await apiService.getList("ChildCard/GetChildCardsStatusByUser");
    List<ChildCardDto> result = [];
    for (var item in jsonMap) {
      var childCard = ChildCardDto.fromJson(item);
      result.add(childCard);
    }
    return result;
  }

  Future<ChildCardDto> getChildCard(num id) async {
    var jsonMap = await apiService.get("ChildCard/GetChildCardById/$id");
    var result = ChildCardDto.fromJson(jsonMap);
    return result;
  }

  Future<ChildCardDto> addChildCard(ChildCardDto child) async {
    var jsonMap =
        await apiService.post("ChildCard/AddChildCard", child.toJson());
    var result = ChildCardDto.fromJson(jsonMap);
    return result;
  }

  Future<ChildCardDto> updateChildCard(ChildCardDto child) async {
    var jsonMap =
        await apiService.put("ChildCard/UpdateChildCard", child.toJson());
    var result = ChildCardDto.fromJson(jsonMap);
    return result;
  }

  Future<bool> deleteChildCard(num id) async {
    var jsonMap = await apiService.delete('ChildCard/DeleteChildCard/$id');
    return jsonMap;
  }
}

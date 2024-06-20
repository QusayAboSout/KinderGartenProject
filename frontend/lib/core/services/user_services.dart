import 'package:frontend/core/services/ApiService.dart';
import 'package:frontend/locator.dart';
import 'package:frontend/model/user.dart';

class UserServices {
  ApiService apiService = locator<ApiService>();
  UserServices();

  Future<List<User>> getUsers() async {
    var jsonMap = await apiService.getList(
      "User/GetUsers",
    );
    List<User> result = [];
    for (var item in jsonMap) {
      var childCard = User.fromJson(item);
      result.add(childCard);
    }
    return result;
  }

  Future<User> getUser(num id) async {
    var jsonMap = await apiService.get("User/GetUserById/$id");
    var result = User.fromJson(jsonMap);
    return result;
  }

  Future<User> getUserById(num id) async {
    var jsonMap = await apiService.get("User/GetUserById/$id");
    var result = User.fromJson(jsonMap);
    return result;
  }

  Future<User> addUser(User child) async {
    var jsonMap = await apiService.post("User/AddUser", child.toJson());
    var result = User.fromJson(jsonMap);
    return result;
  }
}

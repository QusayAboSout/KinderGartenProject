import 'package:frontend/core/services/user_services.dart';
import 'package:frontend/locator.dart';
import 'package:frontend/model/custom_excetion.dart';
import 'package:frontend/model/user.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class UserController extends GetxController {
  UserController();
  bool loading = false;
  var user = User();
  var error = "";
  var service = locator<UserServices>();
  final UserPaginationResult _childCardPaginationResult =
      UserPaginationResult(data: []);
  List<User> allUsers = [];

  final PagingController<int, User> pagingController =
      PagingController(firstPageKey: 0);

  @override
  void onInit() async {
    super.onInit();
    await getUsers();
  }

  Future addUser(Map<String, dynamic> value) async {
    try {
      var child = User.fromJson(value);
      child = await service.addUser(child);
      // pagingController.refresh();
    } on CustomExcetion catch (e) {
      error = e.apiExcetion.messages!.map((e) => e.messageCode).join(" ,");
      update();
    }
  }

  Future getUsers() async {
    try {
      loading = true;
      _childCardPaginationResult.data = await service.getUsers();
      if (_childCardPaginationResult.data != null) {
        allUsers = _childCardPaginationResult.data!;
      }
      loading = false;
      update();
    } on CustomExcetion catch (e) {
      loading = false;
      error = e.apiExcetion.messages!.map((e) => e.messageCode).join(" ,");
      update();
    }
  }

  Future GetUserById(num? id) async {
    if (id == null) return;
    user = await service.getUserById(id);
    pagingController.refresh();
    update();
    refresh();
  }

  checkUserPassword(String email, String password) async {
    try {
      loading = true;
      for (var eml in allUsers) {
        if (eml.userName == email && eml.password == password) {
          return true;
        }
      }
      loading = false;
      update();
      return false;
    } on CustomExcetion catch (e) {
      loading = false;
      error = e.apiExcetion.messages!.map((e) => e.messageCode).join(" ,");
      update();
      return false;
    }
  }
}

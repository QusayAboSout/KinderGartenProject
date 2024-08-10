import 'package:frontend/core/services/post_services.dart';
import 'package:frontend/core/services/session.dart';
import 'package:frontend/locator.dart';
import 'package:frontend/model/Posts.dart';
import 'package:frontend/model/custom_excetion.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  int _selectedIndex = 0;

  var service = locator<PostServices>();
  var error = "";

  void showNotificationPage() {
    _selectedIndex = 2;
    update();
  }

  void showHomePage() {
    _selectedIndex = 0;
    update();
  }

  void showFamilyProfile() {
    _selectedIndex = 3;
    update();
  }

  void showFormsPage() {
    _selectedIndex = 1;
    update();
  }

  int stIndex() {
    return _selectedIndex;
  }

  Future addPost(Map<String, dynamic> value) async {
    try {
      var post = PostDto.fromJson(value);
      post.userID = Session.user?.id;
      post = await service.addPost(post);
      await service.getPosts();
      update();
    } on CustomExcetion catch (e) {
      error = e.apiExcetion.messages!.map((e) => e.messageCode).join(" ,");
      update();
    }
    service.getPosts();
  }
}

import 'package:frontend/core/services/post_services.dart';
import 'package:frontend/locator.dart';
import 'package:frontend/model/Posts.dart';
import 'package:frontend/model/custom_excetion.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PostController extends GetxController {
  bool loading = false;
  var Post = PostDto();
  final PostPaginationResult _PostPaginationResult =
      PostPaginationResult(data: []);
  List<PostDto> posts = [];
  PagingController<int, PostDto> pagingController =
      PagingController(firstPageKey: 0);
  var service = locator<PostServices>();
  var error = "";

  @override
  void onInit() async {
    // TODO: implement onInit
    await getPosts();
    super.onInit();
  }

  Future getPosts() async {
    try {
      loading = true;
      _PostPaginationResult.data = await service.getPosts();
      if (_PostPaginationResult.data != null) {
        posts = _PostPaginationResult.data!;
      }
      loading = false;
      update(['postHome']);
    } on CustomExcetion catch (e) {
      loading = false;
      error = e.apiExcetion.messages!.map((e) => e.messageCode).join(" ,");
      update();
    }
  }

  Future addPost(Map<String, dynamic> value) async {
    try {
      var Post = PostDto.fromJson(value);
      Post = await service.addPost(Post);
      pagingController.refresh();
      update();
      getPosts();
    } on CustomExcetion catch (e) {
      error = e.apiExcetion.messages!.map((e) => e.messageCode).join(" ,");
      update();
    }
  }

  deletePost(num? id) async {
    if (id == null) return;
    var result = await service.deletePost(id);
    pagingController.refresh();
    update();
    getPosts();
  }

  updatePost(PostDto old, Map<String, dynamic> value) async {
    var std = PostDto.fromJson(value);
    std.id = old.id;
    std = await service.updatePost(std);
    refresh();
    update();
    getPosts();
  }
}

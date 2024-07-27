import 'package:frontend/core/services/ApiService.dart';
import 'package:frontend/locator.dart';
import 'package:frontend/model/Posts.dart';

class PostServices {
  ApiService apiService = locator<ApiService>();
  PostServices();

  Future<List<PostDto>> getPosts() async {
    var jsonMap =
        await apiService.getList("Post/GetPosts");
    List<PostDto> result = [];
    for (var item in jsonMap) {
      var subject = PostDto.fromJson(item);
      result.add(subject);
    }
    return result;
  }

  Future<PostDto> getPostById(num id) async {
    var jsonMap = await apiService.get("Post/GetPostById/$id");
    var result = PostDto.fromJson(jsonMap);
    return result;
  }

  Future<PostDto> addPost(PostDto child) async {
    var jsonMap =
        await apiService.post("Post/AddPost", child.toJson());
    var result = PostDto.fromJson(jsonMap);
    return result;
  }

  Future<PostDto> updatePost(PostDto student) async {
    var jsonMap =
        await apiService.put("Post/UpdatePost", student.toJson());
    var result = PostDto.fromJson(jsonMap);
    return result;
  }

    Future<bool> deletePost(num id) async {
    var jsonMap = await apiService.delete('Post/DeletePost/$id');
    return jsonMap;
  }
  
}

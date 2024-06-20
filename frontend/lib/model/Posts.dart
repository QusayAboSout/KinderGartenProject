import 'package:frontend/model/user.dart';

class PostDto {
  num? id;
  String? description;
  DateTime? postDate;
  num? userID;
  User? user;

  PostDto({
    this.id,
    this.description,
    this.postDate,
    this.userID,
    this.user,
  });

  PostDto.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    description = json['discription'];
    postDate =
        json['postDate'] != null ? DateTime.parse(json['postDate']) : null;
    userID = json['userID'];
    if (json['user'] != null) {
      user = User.fromJson(json['user']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['discription'] = description;
    data['postDate'] = postDate?.toIso8601String();
    data['userID'] = userID;
    return data;
  }
}

class PostPaginationResult {
  List<PostDto>? data;
  int? count;

  PostPaginationResult({this.data, this.count});

  PostPaginationResult.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <PostDto>[];
      json['data'].forEach((v) {
        data!.add(PostDto.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = this.data!.map((v) => v.toJson()).toList();
    data['count'] = count;
    return data;
  }
}

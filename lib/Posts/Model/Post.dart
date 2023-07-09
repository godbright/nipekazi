// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  int id;
  String userId;
  String postName;
  String description;
  String image;
  String likes;
  String comments;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  Post({
    required this.id,
    required this.userId,
    required this.postName,
    required this.description,
    required this.image,
    required this.likes,
    required this.comments,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        userId: json["user_id"],
        postName: json["post_name"],
        description: json["description"],
        image: json["image"],
        likes: json["likes"],
        comments: json["comments"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "post_name": postName,
        "description": description,
        "image": image,
        "likes": likes,
        "comments": comments,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

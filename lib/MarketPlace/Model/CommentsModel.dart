// To parse this JSON data, do
//
//     final comment = commentFromJson(jsonString);

import 'dart:convert';

List<Comment> commentFromJson(String str) =>
    List<Comment>.from(json.decode(str).map((x) => Comment.fromJson(x)));

String commentToJson(List<Comment> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Comment {
  int commentId;
  String postId;
  String comment;
  DateTime createdAt;
  CreatedBy createdBy;

  Comment({
    required this.commentId,
    required this.postId,
    required this.comment,
    required this.createdAt,
    required this.createdBy,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        commentId: json["comment_id"],
        postId: json["post_id"],
        comment: json["comment"],
        createdAt: DateTime.parse(json["created_at"]),
        createdBy: CreatedBy.fromJson(json["created_by"]),
      );

  Map<String, dynamic> toJson() => {
        "comment_id": commentId,
        "post_id": postId,
        "comment": comment,
        "created_at": createdAt.toIso8601String(),
        "created_by": createdBy.toJson(),
      };
}

class CreatedBy {
  int id;
  String fName;
  String lName;
  String phone;
  dynamic image;

  CreatedBy({
    required this.id,
    required this.fName,
    required this.lName,
    required this.phone,
    this.image,
  });

  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
        id: json["id"],
        fName: json["f_name"],
        lName: json["l_name"],
        phone: json["phone"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "f_name": fName,
        "l_name": lName,
        "phone": phone,
        "image": image,
      };
}

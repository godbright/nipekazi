import 'dart:convert';

Like likeFromJson(String str) => Like.fromJson(json.decode(str));

String likeToJson(Like data) => json.encode(data.toJson());

class Like {
  int status;
  String message;
  int data;

  Like({
    required this.status,
    required this.message,
    required this.data,
  });

  factory Like.fromJson(Map<String, dynamic> json) => Like(
        status: json["status"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data,
      };
}

// To parse this JSON data, do
//
//     final welcome = welcomeFromMap(jsonString);

import 'dart:convert';

List<Welcome> welcomeFromMap(String str) => List<Welcome>.from(json.decode(str).map((x) => Welcome.fromMap(x)));

String welcomeToMap(List<Welcome> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Welcome {
  int userId;
  int id;
  String title;
  String body;

  Welcome({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Welcome.fromMap(Map<String, dynamic> json) => Welcome(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toMap() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}

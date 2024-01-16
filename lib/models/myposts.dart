// To parse this JSON data, do
//
//     final myposts = mypostsFromMap(jsonString);

import 'dart:convert';

List<Myposts> mypostsFromMap(String str) => List<Myposts>.from(json.decode(str).map((x) => Myposts.fromMap(x)));

String mypostsToMap(List<Myposts> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Myposts {
  int postId;
  int id;
  String name;
  String email;
  String body;

  Myposts({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  factory Myposts.fromMap(Map<String, dynamic> json) => Myposts(
    postId: json["postId"],
    id: json["id"],
    name: json["name"],
    email: json["email"],
    body: json["body"],
  );

  Map<String, dynamic> toMap() => {
    "postId": postId,
    "id": id,
    "name": name,
    "email": email,
    "body": body,
  };
}

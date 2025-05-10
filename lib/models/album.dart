import 'dart:convert';

Album albumFromJson(String str) => Album.fromJson(json.decode(str));
String albumToJson(Album data) => json.encode(data.toJson());

class Album {
  int? userId;
  int id;
  String title;
  Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
    };
  }
}

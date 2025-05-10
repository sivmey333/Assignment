import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_assignment_advanced/models/album.dart';


Future<Album> fetchAlbum() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
  if (response.statusCode == 200) {
    return Album.fromJson(json.decode(response.body));
    
  } else {
    throw Exception('Failed to load album');
  }
}

Future<Album> createAlbum(String title) async {
  final http.Response response = await http.post(
    Uri.parse('https://jsonplaceholder.typicode.com/albums'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  );

  if (response.statusCode == 201) {
    return Album.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to create album');
  }
}




Future<Album> updateAlbum(Album album) async {
  final response = await http.put(
    Uri.parse('https://jsonplaceholder.typicode.com/albums/${album.id}'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(album.toJson()),
  );

  if (response.statusCode == 200) {
    return Album.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to update album');
  }
}
Future<void> deleteAlbum(int id) async {
  final response = await http.delete(
    Uri.parse('https://jsonplaceholder.typicode.com/albums/$id'),
  );

  if (response.statusCode != 200) {
    throw Exception('Failed to delete album');
  }
}
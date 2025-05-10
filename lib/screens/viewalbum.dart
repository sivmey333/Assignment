import 'package:flutter/material.dart';
import 'package:flutter_assignment_advanced/models/album.dart';
import 'package:flutter_assignment_advanced/repo/crud.dart';

class Viewalbum extends StatefulWidget {
  const Viewalbum({super.key});

  @override
  State<Viewalbum> createState() => _ViewalbumState();
}

class _ViewalbumState extends State<Viewalbum> {
  late Future<Album> futureAlbum;
  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Album'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: _buildbody(),
    );
  }
}
Widget _buildbody() {
    return Center(
       child: FutureBuilder<Album>(
        future: fetchAlbum(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data!.title);
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          return CircularProgressIndicator();
        },
      ),
    );
}
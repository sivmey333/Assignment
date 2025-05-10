import 'package:flutter/material.dart';
import 'package:flutter_assignment_advanced/models/album.dart';
import 'package:flutter_assignment_advanced/repo/crud.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Homescreen> {
  late Future<Album> futureAlbum;
  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<Album>(future: futureAlbum, builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.title );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } 
        return CircularProgressIndicator();
      }),
    );
  }
}
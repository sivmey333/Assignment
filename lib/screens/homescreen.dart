import 'package:flutter/material.dart';
import 'package:flutter_assignment_advanced/models/album.dart';
import 'package:flutter_assignment_advanced/repo/crud.dart';
import 'package:flutter_assignment_advanced/screens/createalbum.dart';
import 'package:flutter_assignment_advanced/screens/viewalbum.dart';

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Viewalbum()),
            );
          }, child: Text('View Album'),
        
      ),
      ElevatedButton(onPressed: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Createalbum()),
        );
      }, child: Text('Create Album'),),
      ElevatedButton(onPressed: (){}, child: Text('Update Album'),),
      ElevatedButton(onPressed: (){}, child: Text('Delete Album'),),],
      ),
    );
  }
}
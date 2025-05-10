import 'package:flutter/material.dart';
import 'package:flutter_assignment_advanced/models/album.dart';
import 'package:flutter_assignment_advanced/repo/crud.dart';



class Createalbum extends StatefulWidget {
  const Createalbum({super.key});

  @override
  State<Createalbum> createState() => _CreatealbumState();
}

class _CreatealbumState extends State<Createalbum> {
  final TextEditingController _titleController = TextEditingController();
  Future<Album>? futureAlbum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Album'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: _buildbody(),
    );
  }

Widget _buildbody() {
  //var futureAlbum;

  return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.all(8.0),
    child: (futureAlbum == null)?Column(
      
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextField(
          controller: _titleController,
          decoration: InputDecoration(
            hintText: 'Enter title',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
          onPressed: () {
            setState(() {
              futureAlbum = createAlbum(_titleController.text);
            });
          },
          child: Text('Creates'),
        ),
      ],
    ):FutureBuilder<Album>(future: futureAlbum, builder: (context, snapshot) {
      if (snapshot.hasData) {
        return Text(snapshot.data!.title);
      } else if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      }
      return CircularProgressIndicator();
    },),
  );
}
  
}

import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        actions: [
          IconButton(onPressed: () {},
              icon: Icon(Icons.delete))
        ],
      ),

      body: ListView(),
    );
  }

}

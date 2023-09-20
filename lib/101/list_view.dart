import 'package:flutter/material.dart';

class ListViewExercise extends StatefulWidget {
  const ListViewExercise({Key? key}) : super(key: key);

  @override
  _ListViewExerciseState createState() => _ListViewExerciseState();
}

class _ListViewExerciseState extends State<ListViewExercise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.vertical,
        children: [
          Container(
            height: 300,
            color: Colors.cyan,
          ),
          Container(
            height: 200,
            color: Colors.green,
          ),
          Container(
            height: 500,
            color: Colors.blueGrey,
          ),
          Container(
            height: 400,
            color: Colors.blueAccent,
          ),
        ],
      ),
    );
  }
}

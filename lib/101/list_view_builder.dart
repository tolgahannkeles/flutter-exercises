import 'package:flutter/material.dart';

class ListViewBuilderExercise extends StatefulWidget {
  const ListViewBuilderExercise({Key? key}) : super(key: key);

  @override
  _ListViewBuilderExerciseState createState() => _ListViewBuilderExerciseState();
}

class _ListViewBuilderExerciseState extends State<ListViewBuilderExercise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("List View Builder"),
      ),
      body: ListView.builder(
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 200,
            child: Column(
              children: [
                Expanded(child: Image.network("https://picsum.photos/200")),
                Text("$index"),
              ],
            ),
          );
        },
      ),
    );
  }
}

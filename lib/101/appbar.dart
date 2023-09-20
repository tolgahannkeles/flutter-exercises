import 'package:flutter/material.dart';

class AppBarExercise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Appbar Title"),
        centerTitle: true,
        leading: Icon(Icons.cancel_outlined),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.ac_unit_outlined)),
          Center(
            child: CircularProgressIndicator(),
          )
        ],
      ),
    );
  }
}

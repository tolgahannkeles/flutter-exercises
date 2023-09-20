import 'package:flutter/material.dart';

class ScaffoldExercise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Scaffold Excercise"),
      ),
      body: Column(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_rounded), label: "Love"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications_active_outlined), label: "Notify")
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      drawer: Drawer(),
      extendBody: true,
    );
  }
}

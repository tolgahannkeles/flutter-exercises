import 'package:flutter/material.dart';

class ButtonExercise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        children: [
          TextButton(
              onPressed: () {}, // bu null olduğunda buton disable olur
              child: Text("Add"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.green;
                  }
                  return Colors.amber;
                }),
              )),
          ElevatedButton(
            onPressed: () {},
            child: Text("Elevated"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
            disabledColor: Colors.amber,
          ),
          InkWell(
            onTap: () {},
            child: Text("Inkwell button"),
          )
        ],
      )),
    );
  }
}

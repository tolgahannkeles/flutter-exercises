import 'package:flutter/material.dart';

class ContainerExercise extends StatelessWidget {
  const ContainerExercise({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        SizedBox(
          width: 200,
          height: 200,
          child: Text("*" * 100),
        ),
        Container(
          constraints: const BoxConstraints(
              maxHeight: 200, maxWidth: 300, minWidth: 100, minHeight: 20),
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(20),
          child: const Center(child: Text("3141r3wfs")),
        ),
        Container(
          height: 150,
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.amber,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 5,
              )),
          child: const Center(child: Text("3141r3wfs")),
        )
      ]),
    );
  }
}

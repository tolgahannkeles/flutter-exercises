import 'package:flutter/material.dart';

class ListTileExercise extends StatelessWidget {
  const ListTileExercise({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          ListTile(
            title: const Text("My Car"),
            selected: true,
            selectedColor: Colors.amber,
            //contentPadding: EdgeInsets.zero,
            subtitle: const Text("How do you do fucking vehicle?"),
            onTap: () {},
            leading: const Icon(Icons.money),
            trailing: const Icon(Icons.chevron_right),
          )
        ]),
      ),
    );
  }
}

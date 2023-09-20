import 'package:flutter/material.dart';

class TextExercise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Test Message1",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(wordSpacing: 2, fontStyle: FontStyle.italic),
            ),
            Text(
              "Test Message2",
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
      ),
    );
  }
}

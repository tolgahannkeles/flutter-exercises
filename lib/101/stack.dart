import 'package:flutter/material.dart';

class StackExercise extends StatelessWidget {
  const StackExercise({super.key});

  static const double _cardHeight = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Expanded(
            flex: 4,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned.fill(
                  bottom: _cardHeight / 2,
                  child: Image.network("https://ychef.files.bbci.co.uk/1280x720/p0dqcyrk.jpg", fit: BoxFit.cover),
                ),
                const Positioned(
                  height: _cardHeight,
                  width: 300,
                  bottom: 0,
                  child: Card(
                    margin: EdgeInsets.zero,
                    color: Colors.amber,
                  ),
                )
              ],
            )),
        const Spacer(
          flex: 6,
        ),
      ]),
    );
  }
}

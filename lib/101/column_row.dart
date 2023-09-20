import 'package:flutter/material.dart';

class ColumnRowExercise extends StatelessWidget {
  const ColumnRowExercise({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        // tam ekran flex sayı toplamına map edilir atadığın sayılar onn yüzdesini temsil eder
        Expanded(
          flex: 4,
          child: Container(
            color: Colors.amber,
          ),
        ),
        Expanded(
          flex: 4,
          child: Container(
            color: Colors.pink,
          ),
        ),
        Expanded(
          flex: 4,
          child: Container(
            color: Colors.deepOrange,
          ),
        ),
        const Spacer(
          flex: 2,
        ),
        Expanded(
          flex: 4,
          child: Row(
            children: [
              Expanded(
                  flex: 4,
                  child: Container(
                    color: Colors.lime,
                  )),
              Expanded(
                  flex: 4,
                  child: Container(
                    color: Colors.green,
                  )),
              const Spacer(
                flex: 4,
              ),
              Expanded(flex: 4, child: Container(color: Colors.purple)),
            ],
          ),
        ),
      ]),
    );
  }
}

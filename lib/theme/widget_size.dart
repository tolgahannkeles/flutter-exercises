import 'package:exercise/demos/password_textfield.dart';
import 'package:flutter/material.dart';

class WidgetSizeExercise extends StatefulWidget {
  const WidgetSizeExercise({Key? key}) : super(key: key);

  @override
  _WidgetSizeExerciseState createState() => _WidgetSizeExerciseState();
}

class _WidgetSizeExerciseState extends State<WidgetSizeExercise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          PasswordTextField(),
          Card(
            child: Container(
              height: WidgetSizes.normalCardHeight.value(),
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}

enum WidgetSizes {
  normalCardHeight,
  circleProfileWidht,
}

extension WidgetSizeExtension on WidgetSizes {
  double value() {
    switch (this) {
      case WidgetSizes.normalCardHeight:
        return 30;
      case WidgetSizes.circleProfileWidht:
        return 50;
    }
  }
}

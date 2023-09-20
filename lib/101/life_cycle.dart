import 'package:flutter/material.dart';

class LifeCycleExercise extends StatefulWidget {
  const LifeCycleExercise({Key? key, required this.message}) : super(key: key);

  final String message;

  @override
  _LifeCycleExerciseState createState() => _LifeCycleExerciseState();
}

class _LifeCycleExerciseState extends State<LifeCycleExercise> {
  late String _message;

  @override
  void initState() {
    super.initState();
    _message = _generateMessage(widget.message);
  }

  @override
  void dispose() {
    // Sayfa öldüğünde çağrılır
    super.dispose();
  }

  String _generateMessage(String message) {
    if (message.length.isOdd) {
      message += " Odd";
    } else {
      message += " Even";
    }

    return message;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_message),
      ),
    );
  }
}

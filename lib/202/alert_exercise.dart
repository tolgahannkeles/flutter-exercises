import 'package:flutter/material.dart';

class AlertExercise extends StatefulWidget {
  const AlertExercise({super.key});

  @override
  State<AlertExercise> createState() => _AlertExerciseState();
}

class _AlertExerciseState extends State<AlertExercise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            barrierDismissible: false, // user cannot interact with background.
            builder: (context) {
              return ZoomImageDialog();
            },
          );
        },
        child: Icon(Icons.alarm_add_rounded),
      ),
      appBar: AppBar(),
    );
  }
}

class _ExitDialog extends StatelessWidget {
  const _ExitDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Exit!"),
      actions: [
        ElevatedButton(onPressed: () {}, child: Text("OK")),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Close"))
      ],
    );
  }
}

class ZoomImageDialog extends StatelessWidget {
  const ZoomImageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      child: Dialog(
        insetPadding: EdgeInsets.zero,
        child: Image.network(
          "https://picsum.photos/200",
          fit: BoxFit.cover,
          height: 400,
        ),
      ),
    );
  }
}

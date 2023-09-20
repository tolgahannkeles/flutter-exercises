import 'package:exercise/demos/colors_demo.dart';
import 'package:flutter/material.dart';

class ColorsLifecycleDemo extends StatefulWidget {
  const ColorsLifecycleDemo({Key? key}) : super(key: key);

  @override
  _ColorsLifecycleDemoState createState() => _ColorsLifecycleDemoState();
}

class _ColorsLifecycleDemoState extends State<ColorsLifecycleDemo> {
  Color? _initialBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: _iconButtonOnPressed, icon: Icon(Icons.cancel))],
      ),
      body: Column(
        children: [
          Expanded(
              child: ColorsDemo(
            initialBackgroundColor: _initialBackgroundColor,
          )),
          const Spacer(),
        ],
      ),
    );
  }

  void _iconButtonOnPressed() {
    setState(() {
      _initialBackgroundColor = Colors.green;
    });
  }
}

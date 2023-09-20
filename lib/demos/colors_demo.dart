import 'dart:developer';

import 'package:flutter/material.dart';

class ColorsDemo extends StatefulWidget {
  const ColorsDemo({Key? key, required this.initialBackgroundColor}) : super(key: key);

  final Color? initialBackgroundColor;

  @override
  _ColorsDemoState createState() => _ColorsDemoState();
}

class _ColorsDemoState extends State<ColorsDemo> {
  Color? _backgroundColor;

  @override
  void initState() {
    super.initState();
    _backgroundColor = widget.initialBackgroundColor ?? Colors.transparent;
  }

  @override
  void didUpdateWidget(covariant ColorsDemo oldWidget) {
    super.didUpdateWidget(oldWidget);
    inspect(oldWidget);
    if (widget.initialBackgroundColor != _backgroundColor) {
      setState(() {
        _changeBackgroundColor(widget.initialBackgroundColor!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: _backgroundColor,
      ),
      bottomNavigationBar:
          BottomNavigationBar(onTap: (value) => _bottomOnTap(value), items: [
        BottomNavigationBarItem(
            icon: _buildBottomColorContainer(Colors.red), label: "Red"),
        BottomNavigationBarItem(
            icon: _buildBottomColorContainer(Colors.blue), label: "Blue"),
        BottomNavigationBarItem(
            icon: _buildBottomColorContainer(Colors.orange), label: "Orange"),
      ]),
    );
  }

  Container _buildBottomColorContainer(Color color) {
    return Container(
      width: 10,
      height: 10,
      color: color,
    );
  }

  void _bottomOnTap(int currentIndex) {
    if (currentIndex == _ColorEnum.red.index) {
      _changeBackgroundColor(Colors.red);
    } else if (currentIndex == _ColorEnum.blue.index) {
      _changeBackgroundColor(Colors.blue);
    } else if (currentIndex == _ColorEnum.orange.index) {
      _changeBackgroundColor(Colors.orange);
    }
  }

  void _changeBackgroundColor(Color color) {
    setState(() {
      _backgroundColor = color;
    });
  }
}

enum _ColorEnum { red, blue, orange }

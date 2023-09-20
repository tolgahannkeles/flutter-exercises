import 'package:exercise/product/languages/language_items.dart';
import 'package:flutter/material.dart';

class IncrementButton extends StatefulWidget {
  const IncrementButton({Key? key}) : super(key: key);

  @override
  _IncrementButtonState createState() => _IncrementButtonState();
}

class _IncrementButtonState extends State<IncrementButton> {
  int _countValue = 0;

  void _increment() {
    setState(() {
      _countValue++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: _increment, child: Text("${LanguageItems.welcomeTitle} $_countValue"));
  }
}

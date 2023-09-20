import 'package:flutter/material.dart';

class NavigationDetail extends StatefulWidget {
  const NavigationDetail({Key? key, this.isConfirmed = false}) : super(key: key);

  final bool isConfirmed;

  @override
  _NavigationDetailState createState() => _NavigationDetailState();
}

class _NavigationDetailState extends State<NavigationDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton.icon(
            onPressed: () {
              Navigator.of(context).pop<bool>(!widget.isConfirmed);
            },
            icon: Icon(widget.isConfirmed ? Icons.cancel_outlined : Icons.check),
            label: Text(widget.isConfirmed ? "Decline" : "Confirm")),
      ),
    );
  }
}

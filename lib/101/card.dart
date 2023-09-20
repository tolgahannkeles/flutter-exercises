import 'package:flutter/material.dart';

class CardExercise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(10),
            color: Theme.of(context).colorScheme.error,
            shape: StadiumBorder(),
            child: SizedBox(
              height: 100,
              width: 100,
            ),
          )
        ],
      ),
    );
  }
}



/*
Border Styles
StadiumBorder
RoundedRectangleBorder
CircleBorder
*/ 

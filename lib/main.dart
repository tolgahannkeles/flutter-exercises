import 'package:exercise/101/image.dart';
import 'package:exercise/202/animated_exercise.dart';
import 'package:exercise/202/form_exercise.dart';
import 'package:exercise/202/image_exercise_202.dart';
import 'package:exercise/202/state_manage/state_management_exercise.dart';
import 'package:exercise/theme/widget_size.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(),
      debugShowCheckedModeBanner: false,
      home: const FormExercise(),
    );
  }
}

/*
ThemeData.dark().copyWith(
        tabBarTheme: const TabBarTheme(
          labelColor: Colors.amber,
          unselectedLabelColor: Colors.green,
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.label,
          labelPadding: EdgeInsets.zero,
        ),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Colors.amber,
        ),
        inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: Colors.white,
            iconColor: Colors.amber,
            border: OutlineInputBorder(),
            labelStyle: TextStyle(color: Colors.black),
            floatingLabelStyle: TextStyle(color: Colors.pink)),
        textSelectionTheme: const TextSelectionThemeData(
          selectionColor: Colors.red,
          selectionHandleColor: Colors.red,
        ),
        listTileTheme: const ListTileThemeData(
          contentPadding: EdgeInsets.zero,
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          backgroundColor: Colors.transparent,
          elevation: 0,
          actionsIconTheme: IconThemeData(color: Colors.amber),
        ),
      ),

*/

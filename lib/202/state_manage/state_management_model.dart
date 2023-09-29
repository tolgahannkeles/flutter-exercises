import 'package:exercise/202/state_manage/state_management_exercise.dart';
import 'package:flutter/material.dart';

abstract class StateManagementModel extends State<StateManagementExercise> {
  bool isVisible = false;
  bool isOpac = true;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
  }

  void changeVisibilty() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  void changeOpacity() {
    setState(() {
      isOpac = !isOpac;
    });
  }
}

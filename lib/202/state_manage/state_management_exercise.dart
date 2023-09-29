import 'package:exercise/202/state_manage/state_management_model.dart';
import 'package:flutter/material.dart';

class StateManagementExercise extends StatefulWidget {
  const StateManagementExercise({super.key});

  @override
  State<StateManagementExercise> createState() => _StateManagementExerciseState();
}

class _StateManagementExerciseState extends StateManagementModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isVisible ? Colors.purple : Colors.amber,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          changeVisibilty();
        },
      ),
    );
  }
}

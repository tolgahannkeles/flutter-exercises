import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PackageExercise extends StatefulWidget {
  const PackageExercise({super.key});

  @override
  State<PackageExercise> createState() => _PackageExerciseState();
}

class _PackageExerciseState extends State<PackageExercise> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SpinKitSquareCircle(
        color: Colors.white,
        size: 50.0,
        controller: AnimationController(
            vsync: this, duration: const Duration(milliseconds: 1200)),
      ),
    );
  }
}

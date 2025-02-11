import 'package:flutter/material.dart';
import 'package:moveset/model/workout.dart';

class MuscleUpWorkoutScreen extends StatelessWidget {
  final Workout workout;
  const MuscleUpWorkoutScreen({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teste'),
      ),
    );
  }
}

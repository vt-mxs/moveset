import 'package:flutter/material.dart';
import 'package:moveset/model/workout.dart';
import 'package:moveset/view/home/home_widgets/rounded_header.dart';

class MuscleUpWorkoutScreen extends StatelessWidget {
  final Workout workout;
  const MuscleUpWorkoutScreen({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Stack(
        children: [
          RoundedHeader(
            title: 'Muscle Up'
          )
        ],
      ),
    );
  }
}

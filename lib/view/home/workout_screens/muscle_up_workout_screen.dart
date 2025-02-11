import 'package:flutter/material.dart';

class MuscleUpWorkoutScreen extends StatefulWidget {
  const MuscleUpWorkoutScreen({super.key});

  @override
  State<MuscleUpWorkoutScreen> createState() => _MuscleUpWorkoutScreenState();
}

class _MuscleUpWorkoutScreenState extends State<MuscleUpWorkoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teste'),
      ),
    );
  }
}
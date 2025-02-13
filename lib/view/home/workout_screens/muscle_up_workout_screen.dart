import 'package:flutter/material.dart';
import 'package:moveset/core/widgets/responsive_text.dart';
import 'package:moveset/model/phase.dart';
import 'package:moveset/model/workout.dart';
import 'package:moveset/view/home/home_widgets/rounded_header.dart';

class MuscleUpWorkoutScreen extends StatelessWidget {
  final Workout workout;
  const MuscleUpWorkoutScreen({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;    
    return Scaffold(
      body: Stack(
        children: [
          RoundedHeader(
            title: 'Muscle Up'
          ),

          Container(
            padding: EdgeInsets.only(top: screenHeight * 0.3),
            
            child: ListView.builder(
              itemCount: workout.phases.length,
              itemBuilder: (context, index) {
                final Phase phase = workout.phases[index];
                return Card(
                  elevation: 4,
                  margin: EdgeInsets.all(screenHeight * 0.02),
                  child: ListTile(
                    title: ResponsiveText(
                      text: phase.name,
                      fontSize: 5
                    ),
                    onTap: () {
                      print(':)');
                    },
                  ),
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}

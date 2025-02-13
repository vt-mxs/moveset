import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moveset/core/constants/app_colors.dart';
import 'package:moveset/core/widgets/responsive_text.dart';
import 'package:moveset/model/workout.dart';
import 'package:moveset/view/home/home_widgets/rounded_header.dart';
import 'package:moveset/view/home/workout_screens/muscle_up_workout_screen.dart';
import 'package:moveset/viewmodel/workout_viewmodel.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Map<String, Widget Function(Workout)> workoutScreens = {
    'Muscle Up': (workout) => MuscleUpWorkoutScreen(workout: workout)
  };

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_)  {
      context.read<WorkoutViewModel>().fetchWorkouts();
    });
  }

  PageRouteBuilder _fadeAnimationTransition(RoutePageBuilder pageBuilder){
    return PageRouteBuilder(
      pageBuilder: pageBuilder,
      transitionDuration: Durations.medium4,
      transitionsBuilder:(context, animation, secondAnimation, child) => FadeTransition(
        opacity: animation,
        child: child,
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        body: Stack(
          children:[
            RoundedHeader(
              title: 'Teste'
            ),

            Consumer<WorkoutViewModel>(
              builder: (context, workoutViewModel, child) {
                if(workoutViewModel.isLoading){
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: AppColors.mainShowCaseBlue,
                    )
                  );
                }

                return Container(
                  margin: EdgeInsets.only(top: screenHeight * 0.3),
                  color: AppColors.mainIceWhite,
                  child: ListView.builder(
                    itemCount: workoutViewModel.workouts.length,
                    itemBuilder: (context, index){
                      final Workout workout = workoutViewModel.workouts[index];
                      return Card(
                        elevation: 4,
                        margin: EdgeInsets.all(screenHeight * 0.02),
                        child: ListTile(
                          title: ResponsiveText(
                            text: workout.name,
                            fontSize: 5
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              _fadeAnimationTransition(
                                (context, animation, secondAnimation) => workoutScreens[workout.name]!(workout)
                              )
                            );
                          },
                        ),
                      );
                    }
                  ),
                );
              }
            )  
          ]
        )
      ),
    );
  }
}
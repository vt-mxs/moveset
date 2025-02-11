import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moveset/core/constants/app_colors.dart';
import 'package:moveset/core/widgets/responsive_text.dart';
import 'package:moveset/model/workout.dart';
import 'package:moveset/view/home/workout_screens/muscle_up_workout_screen.dart';
import 'package:moveset/viewmodel/workout_viewmodel.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_)  {
      context.read<WorkoutViewModel>().fetchWorkouts();
    });
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
            Container(
              width: double.infinity,
              height: screenHeight * 0.3,
              decoration: BoxDecoration(
                color: AppColors.mainGray,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100)
                )
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  top: 100
                ),
                child: ResponsiveText(
                  text: 'Teste',
                  fontSize: 5,
                  align: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.mainIceWhite,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
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
                              MaterialPageRoute(
                                builder: (context) => MuscleUpWorkoutScreen(workout: workout)
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

            /*
            Align(
              alignment: Alignment.bottomCenter,
              child: Consumer<WorkoutViewModel>(
                builder: (context, workoutViewModel, widget) {
                  if(workoutViewModel.isLoading) return Center(child: CircularProgressIndicator());
              
                  return Container(
                    margin: EdgeInsets.only(top: screenHeight * 0.3),
                    color: AppColors.mainGray,
                    child: ListView.builder(
                      itemCount: workoutViewModel.workouts.length,
                      itemBuilder: (context, index) {
                        final Workout workout = workoutViewModel.workouts[index];
                        return Card(
                          elevation: 4,
                          margin: EdgeInsets.all(screenHeight * 0.02),
                          
                          child: ListTile(
                            title: ResponsiveText(
                              text: workout.name,
                              fontSize: 5
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              ),
            ),*/  
          ]
        )
      ),
    );
  }
}
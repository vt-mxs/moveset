import 'package:flutter/foundation.dart';
import 'package:moveset/model/workout.dart';
import 'package:moveset/service/workout_service.dart';

class WorkoutViewModel extends ChangeNotifier {
  final WorkoutService _service = WorkoutService();
  List<Workout> workouts = [];
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> fetchWorkouts() async {
    _isLoading = true;
    notifyListeners();

    workouts = await _service.getWorkouts();

    _isLoading = false;
    notifyListeners();
  }
}

import 'package:moveset/model/exercise.dart';

class Phase {
  final String id;
  final String name;
  final List<Exercise> exercises;

  Phase({
    required this.id,
    required this.name,
    required this.exercises
  });

  factory Phase.fromMap(Map<String, dynamic> map, String id) {
    return Phase(
      id: id,
      name: map['name'],
      exercises: (map['exercises'] as List<dynamic>?)
        ?.map((exerciseMap) => Exercise.fromMap(exerciseMap, exerciseMap['id']))
        .toList() ?? []
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'exercises': exercises.map((exercise) => exercise.toMap()).toList()
    };
  }
}

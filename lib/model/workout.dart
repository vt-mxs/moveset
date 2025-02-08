import 'package:moveset/model/phase.dart';

class Workout {
  final String id;
  final String name;
  final List<Phase> phases;

  Workout({
    required this.id,
    required this.name,
    required this.phases
  });

  factory Workout.fromMap(Map<String, dynamic> map, String id) {
    return Workout(
      id: id,
      name: map['name'],
      phases: (map['phases'] as List<dynamic>?)
              ?.map((phaseMap) => Phase.fromMap(phaseMap, phaseMap['id']))
              .toList() ?? []
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phases': phases.map((phase) => phase.toMap()).toList(),
    };
  }
}
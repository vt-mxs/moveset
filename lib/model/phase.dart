import 'package:cloud_firestore/cloud_firestore.dart';
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

  /// Converte um documento Firestore para um objeto `Phase`
  static Future<Phase> fromFirestore(DocumentSnapshot doc) async {
    String id = doc.id;
    Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;

    if (data == null) {
      throw Exception('Documento vazio.');
    }

    // Busca os exercícios na subcoleção "exercises"
    List<Exercise> exercises = await FirebaseFirestore.instance
        .collection('workouts')
        .doc(doc.reference.parent.parent!.id) // ID do workout
        .collection('phases')
        .doc(id)
        .collection('exercises')
        .get()
        .then((querySnapshot) {
      return querySnapshot.docs.map((exerciseDoc) {
        return Exercise.fromMap(exerciseDoc.data(), exerciseDoc.id);
      }).toList();
    });

    return Phase(
      id: id,
      name: data['name'],
      exercises: exercises
    );
  }

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

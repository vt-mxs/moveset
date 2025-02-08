import 'package:cloud_firestore/cloud_firestore.dart';
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

  static Future<Workout> fromFirestore(DocumentSnapshot doc) async{
    String id = doc.id;
    Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;

    if(data == null) return Future.error(Exception('Workout não existe'));

    List<Phase> phases = await FirebaseFirestore.instance
        .collection('workouts')
        .doc(id)
        .collection('phases')
        .get()
        .then((querySnapshot) async {
          return Future.wait(querySnapshot.docs.map((phaseDoc) async {
            return await Phase.fromFirestore(phaseDoc);
          }
        ).toList());
    });

    return Workout(
      id: id,
      name: data['name'],
      phases: phases
    );
  }

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
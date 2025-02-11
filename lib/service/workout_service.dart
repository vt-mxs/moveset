import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moveset/model/workout.dart';

class WorkoutService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /*
    DocumentSnapshot doc = await FirebaseFirestore.instance
      .collection('workouts')
      .doc('muscle_up')
      .get();
  */

  Future<List<Workout>> getWorkouts() async {
    QuerySnapshot querySnapshot;

    try{
      querySnapshot = await _firestore
        .collection('workouts').get(GetOptions(source: Source.cache));
      
      if(querySnapshot.docs.isEmpty){
        querySnapshot = await FirebaseFirestore.instance
          .collection('workouts')
          .get(const GetOptions(source: Source.server));
      }

    }catch(e){
      querySnapshot = await FirebaseFirestore.instance
        .collection('workouts')
        .get(const GetOptions(source: Source.server));
    }
    
    return Future.wait(querySnapshot.docs.map(
      (doc) => Workout.fromFirestore(doc)).toList()
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:moveset/model/moveset_user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<MovesetUser?> register(String name, String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password
      );
      
      String uid = result.user!.uid;

      await _firestore.collection('users').doc(uid)
        .set({
          'id': uid,
          'name': name,
          'email': email}
        );

      return MovesetUser(id: uid, name: name, email: email);
    } catch (e) {
      print("erro $e");
      return null;
    }
  }
}

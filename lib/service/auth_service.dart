import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:moveset/core/utils/response.dart';
import 'package:moveset/core/utils/validator.dart';
//import 'package:moveset/model/moveset_user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Response> register(String name, String email, String password) async {
    Response nameResult = Validator.validateName(name);
    Response emailResult = Validator.validateEmail(email);
    Response passwordResult = Validator.validatePassword(password);

    if (nameResult.isFailure) return nameResult;
    if (emailResult.isFailure) return emailResult;
    if (passwordResult.isFailure) return passwordResult;

    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password
      );
      
      String uid = result.user!.uid;

      await _firestore.collection('users').doc(uid).set({
        'id': uid,
        'name': name,
        'email': email
      });

      return Response.success();
    } on FirebaseAuthException catch(e) {
      if(e.code == 'email-already-in-use'){
        return Response.failure('Email já cadastrado');
      }
      return Response.failure('Erro inesperado, volte mais tarde');
    }
  }

  Future<Response> login(String email, String password) async {
    Response emailResult = Validator.validateEmail(email);
    Response passwordResult = Validator.validatePassword(password);

    if (emailResult.isFailure) return emailResult;
    if (passwordResult.isFailure) return passwordResult;

    try {
      UserCredential loginResult = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password
      );

      return (loginResult.user != null) ?
        Response.success() : Response.failure('Credenciais inválidas');
    
    } on FirebaseAuthException catch (e) {
      return Response.failure(e.code);
    }catch(e){
      return Response.failure('Erro inesperado, tente novamente mais tarde');
    }
  }
}

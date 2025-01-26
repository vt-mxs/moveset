import 'package:flutter/foundation.dart';
import 'package:moveset/core/utils/response.dart';
import 'package:moveset/service/auth_service.dart';

class AuthViewmodel with ChangeNotifier {
  final AuthService _service = AuthService();
  static const String success = 'succes';
  static const String unknownError = 'Problemas técnicos, volte mais tarde';
  bool isLoading = false;

  Future<String> register(String name, String email, String password) async {
    isLoading = true;
    notifyListeners();

    Response result = await _service.register(name, email, password);

    isLoading = false;
    notifyListeners();

    if (result.isFailure) {
      return result.message ?? unknownError;
    }

    return success;
  }

  Future<String> login(String email, String password) async {
    isLoading = true;
    notifyListeners();

    Response result = await _service.login(email, password);
    
    isLoading = false;
    notifyListeners();

    if (result.isFailure) {
      return result.message ?? unknownError;
    }

    return success;
  }
}

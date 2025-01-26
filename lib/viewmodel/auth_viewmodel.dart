import 'package:flutter/foundation.dart';
import 'package:moveset/core/utils/response.dart';
import 'package:moveset/service/auth_service.dart';

class AuthViewmodel with ChangeNotifier {
  final AuthService _service = AuthService();
  static const String success = 'succes';
  static const String unknownError = 'Problemas técnicos, volte mais tarde';

  Future<String> register(String name, String email, String password) async {
    notifyListeners();

    Response result = await _service.register(name, email, password);

    notifyListeners();

    if (result.isFailure) {
      return result.message ?? unknownError;
    }

    notifyListeners();

    return success;
  }

  Future<String> login(String email, String password) async {
    notifyListeners();

    Response result = await _service.login(email, password);

    if (result.isFailure) {
      notifyListeners();
      return result.message ?? unknownError;
    }

    notifyListeners();

    return success;
  }
}

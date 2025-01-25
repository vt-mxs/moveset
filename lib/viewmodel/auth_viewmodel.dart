import 'package:flutter/foundation.dart';
import 'package:moveset/core/utils/response.dart';
import 'package:moveset/service/auth_service.dart';

class AuthViewmodel with ChangeNotifier {
  final AuthService _service = AuthService();
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<String?> register(String name, String email, String password) async {
    _isLoading = true;
    notifyListeners();

    Response result = await _service.register(name, email, password);
    
    if (result.isFailure) {
      _isLoading = false;
      notifyListeners();
      return result.message;
    }

    _isLoading = false;
    notifyListeners();

    return null; // sucesso
  }
}

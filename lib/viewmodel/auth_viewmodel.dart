import 'package:flutter/foundation.dart';
import 'package:moveset/service/auth_service.dart';

class AuthViewmodel with ChangeNotifier {
  final AuthService _service = AuthService();
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> register(String name, String email, String password) async {
    _isLoading = true;
    notifyListeners();

    await _service.register(name, email, password);

    _isLoading = false;
    notifyListeners();
  }
}

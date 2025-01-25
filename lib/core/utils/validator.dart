import 'package:moveset/core/utils/response.dart';

class Validator {
  static bool _isEmpty(String? value) {
    return value == null || value.isEmpty;
  }

  static Response validateName(String? value) {
    if (_isEmpty(value) || value!.length < 2){
      return Response.failure('Nome deve ter 2 caracteres ou mais');
    } 

    return Response.success();
  }

  static Response validateEmail(String? value) {
    if(_isEmpty(value) || !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value!)){
      return Response.failure('Ensira um email válido');
    }

    return Response.success();
  }

  static Response validatePassword(String? value) {
    if (_isEmpty(value) || value!.length < 6) {
      return Response.failure('A senha deve ter pelo menos 6 caracteres');
    }

    return Response.success();
  }
}

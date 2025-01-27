class Response {
  final String message;
  final bool _success;

  Response.success({this.message = ''}) : _success = true;

  Response.failure(this.message) : _success = false;

  bool get isSuccess => _success;

  bool get isFailure => !_success;
}

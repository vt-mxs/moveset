class Response {
  String? message;
  final bool _success;

  Response.success() : _success = true;

  Response.failure(this.message) : _success = false;

  bool get isSuccess => _success;

  bool get isFailure => !_success;
}

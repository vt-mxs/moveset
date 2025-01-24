class MovesetUser {
  final String? id; // id do usúario pode ser nulo antes do cadastro
  final String name;
  final String email;
  final String? password; // senha pode ser nula apos o login

  MovesetUser({this.id, required this.name, required this.email, this.password});
}
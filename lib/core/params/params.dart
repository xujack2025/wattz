class AuthParams {
  AuthParams({required this.email, required this.password});
  final String email;
  final String password;
}

class ConnectorParams {
  const ConnectorParams({required this.type, required this.count});
  final String type;
  final int count;
}

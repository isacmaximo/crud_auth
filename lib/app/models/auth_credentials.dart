import 'dart:convert';

class AuthCredentialsDTO {
  String login;
  String password;

  AuthCredentialsDTO({
    required this.login,
    required this.password,
  });

  AuthCredentialsDTO copyWith({
    String? login,
    String? password,
  }) {
    return AuthCredentialsDTO(
      login: login ?? this.login,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'login': login,
      'password': password,
    };
  }

  factory AuthCredentialsDTO.fromMap(Map<String, dynamic> map) {
    return AuthCredentialsDTO(
      login: map['login'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthCredentialsDTO.fromJson(String source) =>
      AuthCredentialsDTO.fromMap(json.decode(source));

  @override
  String toString() => 'AuthCredentialsDTO(login: $login, password: $password)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthCredentialsDTO &&
        other.login == login &&
        other.password == password;
  }

  @override
  int get hashCode => login.hashCode ^ password.hashCode;
}

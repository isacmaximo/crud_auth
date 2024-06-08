// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserDTO {
  String? login;
  String? password;
  UserDTO({
    this.login,
    this.password,
  });

  UserDTO copyWith({
    String? login,
    String? password,
  }) {
    return UserDTO(
      login: login ?? this.login,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'login': login,
      'password': password,
    };
  }

  factory UserDTO.fromMap(Map<String, dynamic> map) {
    return UserDTO(
      login: map['login'] != null ? map['login'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDTO.fromJson(String source) =>
      UserDTO.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserDTO(login: $login, password: $password)';

  @override
  bool operator ==(covariant UserDTO other) {
    if (identical(this, other)) return true;

    return other.login == login && other.password == password;
  }

  @override
  int get hashCode => login.hashCode ^ password.hashCode;
}

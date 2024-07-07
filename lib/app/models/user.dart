// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  String? id;
  String? login;
  String? password;
  User({
    this.id,
    this.login,
    this.password,
  });

  User copyWith({
    String? id,
    String? login,
    String? password,
  }) {
    return User(
      id: id ?? this.id,
      login: login ?? this.login,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'login': login,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] != null ? map['id'] as String : null,
      login: map['login'] != null ? map['login'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'User(id: $id, login: $login, password: $password)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id && other.login == login && other.password == password;
  }

  @override
  int get hashCode => id.hashCode ^ login.hashCode ^ password.hashCode;
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TokenJWT {
  String token;

  TokenJWT(this.token);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
    };
  }

  factory TokenJWT.fromMap(Map<String, dynamic> map) {
    return TokenJWT(map['token'] as String);
  }

  String toJson() => json.encode(toMap());

  factory TokenJWT.fromJson(String source) =>
      TokenJWT.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TokenJWT(token: $token)';

  @override
  bool operator ==(covariant TokenJWT other) {
    if (identical(this, other)) return true;
    return other.token == token;
  }

  @override
  int get hashCode => token.hashCode;
}

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
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NotificationRequest {
  String? title;
  String? body;
  String? topic;
  String? token;
  NotificationRequest({
    this.title,
    this.body,
    this.topic,
    this.token,
  });

  NotificationRequest copyWith({
    String? title,
    String? body,
    String? topic,
    String? token,
  }) {
    return NotificationRequest(
      title: title ?? this.title,
      body: body ?? this.body,
      topic: topic ?? this.topic,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'body': body,
      'topic': topic,
      'token': token,
    };
  }

  factory NotificationRequest.fromMap(Map<String, dynamic> map) {
    return NotificationRequest(
      title: map['title'] != null ? map['title'] as String : null,
      body: map['body'] != null ? map['body'] as String : null,
      topic: map['topic'] != null ? map['topic'] as String : null,
      token: map['token'] != null ? map['token'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory NotificationRequest.fromJson(String source) =>
      NotificationRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'NotificationRequest(title: $title, body: $body, topic: $topic, token: $token)';
  }

  @override
  bool operator ==(covariant NotificationRequest other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.body == body &&
        other.topic == topic &&
        other.token == token;
  }

  @override
  int get hashCode {
    return title.hashCode ^ body.hashCode ^ topic.hashCode ^ token.hashCode;
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hui/models/user_model.dart';
import 'package:uuid/uuid.dart';

class Post {
  final String id;
  final String title;
  final String body;
  final User user;

  Post({
    String? id, // here we make the id optional by adding a question mark
    required this.title,
    required this.body,
    required this.user,
  }) : id = id ??
            Uuid()
                .v4(); // here we use the null-aware operator to generate a new id if the id is null

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      user: User.fromJson(json['user']),
    );
  }

  Post copyWith({
    String? id,
    String? title,
    String? body,
    User? user,
  }) {
    return Post(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'body': body,
      'user': user.toMap(),
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'] as String,
      title: map['title'] as String,
      body: map['body'] as String,
      user: User.fromMap(map['user'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'Post(id: $id, title: $title, body: $body, user: $user)';
  }

  @override
  bool operator ==(covariant Post other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.body == body &&
        other.user == user;
  }

  @override
  int get hashCode {
    return id.hashCode ^ title.hashCode ^ body.hashCode ^ user.hashCode;
  }
}

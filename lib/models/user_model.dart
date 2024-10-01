// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hui/models/post_model.dart';
import 'package:uuid/uuid.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String password;
  List<Post> posts = [];

  User({
    String? id, // here we make the id optional by adding a question mark
    required this.name,
    required this.email,
    required this.password,
  }) : id = id ??
            Uuid()
                .v4(); // here we use the null-aware operator to generate a new id if the id is null

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
    );
  }

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, password: $password)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ email.hashCode ^ password.hashCode;
  }

  void addPost(Post post) {
    posts.add(post);
  }

  void removePost(Post post) {
    posts.remove(post);
  }
}

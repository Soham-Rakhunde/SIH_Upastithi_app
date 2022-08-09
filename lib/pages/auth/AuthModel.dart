import 'package:flutter/material.dart';

@immutable
class AuthModel {
  const AuthModel({this.id, this.mobile, this.name, this.email});

  final bool isAuthenticated = false;
  final String? id;
  // final String? uuid;
  final String? mobile;
  final String? name;
  final String? email;

  AuthModel copyWith(
      {String? id, String? mobile, String? name, String? email}) {
    return AuthModel(
      id: id ?? this.id,
      mobile: mobile ?? this.mobile,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }
}

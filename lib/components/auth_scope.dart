import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthScope extends InheritedWidget {
  const AuthScope({
    super.key,
    required super.child,
    this.user,
  });

  final User? user;

  static User? userOf(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<AuthScope>();
    assert(result != null);
    return result?.user;
  }

  @override
  bool updateShouldNotify(covariant AuthScope oldWidget) {
    return user != oldWidget.user;
  }
}

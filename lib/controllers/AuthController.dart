// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';
import 'package:e_commerce/services/auth.dart';

class AuthController with ChangeNotifier {
  final AuthBase auth;
  String? name;
  String? email;
  String? password;

  AuthController({
    required this.auth,
    this.email = "",
    this.password = "",
    this.name = "",
  });

  void updateName(String name) => copyWith(name: name);
  void updateEmail(String email) => copyWith(email: email);
  void updatePassword(String password) => copyWith(password: password);

  Future<void> Login(bool login) async {
    try {
      login
          ? await auth.loginWithEmailAndPassword(email!, password!)
          : await auth.signUpWithEmailAndPassword(email!, password!);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    auth.signOut();
  }

  void copyWith({String? email, String? password, String? name}) {
    this.email = email ?? this.email;
    this.password = password ?? this.password;
    this.name = name ?? this.name;
    notifyListeners();
  }
}

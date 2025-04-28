import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthBase {
  User? get currentUser;
  Stream<User?> authStateChanges();
  Future<User?> loginWithEmailAndPassword(String email, String pass);
  Future<User?> signUpWithEmailAndPassword(String email, String pass);
  Future<void> signOut();
}

class Auth implements AuthBase {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Future<User?> loginWithEmailAndPassword(String email, String pass) async {
    final user = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: pass,
    );
    return user.user;
  }

  @override
  Future<User?> signUpWithEmailAndPassword(String email, String pass) async {
    final user = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: pass,
    );

    return user.user;
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();

  @override
  User? get currentUser => _firebaseAuth.currentUser;
}

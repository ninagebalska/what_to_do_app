import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  Stream<User?> authState() {
    return FirebaseAuth.instance.authStateChanges();
  }

  Future<void> register(
      {required String email, required String password}) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signIn({required String email, required String password}) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}

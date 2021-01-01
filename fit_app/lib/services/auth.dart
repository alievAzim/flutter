import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_app/domain/user.dart';

class AuthService {
  final FirebaseAuth _fAuth = FirebaseAuth.instance;

  Future<Users> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await _fAuth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return Users.fromFirebase(user);
    } catch (e) {
      return null;
    }
  }

  Future<Users> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await _fAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return Users.fromFirebase(user);
    } catch (e) {
      return null;
    }
  }

  Future logOut() async {
    await _fAuth.signOut();
  }

  Stream<Users> get currentUser {
    return _fAuth
        .authStateChanges()
        .map((User user) => user != null ? Users.fromFirebase(user) : null);
  }
}

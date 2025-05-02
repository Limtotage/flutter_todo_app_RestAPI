import "package:firebase_auth/firebase_auth.dart";

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get currentUser => _firebaseAuth.currentUser;
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
  //User? verisi değişirse haberimiz olacak Stream Değişim olunca çağrılıyor.
  //register
  // Future async yapılar için kullanılır içerisinde veri bekleriz
  Future<void> createUser(
      {required String email, required String password}) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  //login
  Future<void> userLogin(
      {required String email, required String password}) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  // sign out
  Future<void> userLogout() async {
    await _firebaseAuth.signOut();
  }
}

import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth;

  AuthRepository({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  // Connexion avec email et mot de passe
  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw e;
    } catch (e) {
      throw Exception(
          "Une erreur inattendue est survenue lors de la connexion.");
    }
  }

  // Inscription
  Future<UserCredential> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw e;
    } catch (e) {
      throw Exception(
          "Une erreur inattendue est survenue lors de l'inscription.");
    }
  }

  // Déconnexion
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  // Stream pour écouter l'état de connexion
  Stream<User?> get user => _firebaseAuth.authStateChanges();

  // Récupérer l’utilisateur courant
  User? getCurrentUser() => _firebaseAuth.currentUser;
}

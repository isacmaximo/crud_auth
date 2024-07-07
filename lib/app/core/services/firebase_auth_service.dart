import 'package:crud_auth/app/models/auth_credentials.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  late FirebaseAuth _firebaseAuth;

  FirebaseAuthService() {
    _firebaseAuth = FirebaseAuth.instance;
  }

  Future<String?> getFirebaseIdToken() async {
    return await _firebaseAuth.currentUser?.getIdToken();
  }

  Future<String?> signInWithEmail(AuthCredentialsDTO dto) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: dto.login,
        password: dto.password,
      );
      return await _firebaseAuth.currentUser!.getIdToken();
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          throw FlutterError('Email não encontrado na base de dados!');
        case 'wrong-password':
          throw FlutterError('Senha incorreta!');
        default:
          throw FlutterError('Falha ao realizar login com email!');
      }
    }
  }

  Future<String?> signInWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return null;

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await _firebaseAuth.signInWithCredential(credential);
      return await _firebaseAuth.currentUser?.getIdToken();
    } catch (e) {
      throw FlutterError('Falha ao realizar login com google!');
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw FlutterError(
          'Falha ao tentar enviar email para recuperação de senha!');
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    await GoogleSignIn().signOut();
  }
}

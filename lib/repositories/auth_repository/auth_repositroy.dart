import 'package:bookstore_app/core/exceptions/auth_exception.dart';
import 'package:bookstore_app/models/user_model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositroy {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;

  AuthRepositroy()
      : _firebaseAuth = FirebaseAuth.instance,
        _firebaseFirestore = FirebaseFirestore.instance;

  Future<bool> signUp({
    required String username,
    required String email,
    required String password,
    required String address,
  }) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = userCredential.user;

      if (user == null) {
        throw AuthException('User creation failed');
      }

      final userModel = UserModel(
        uid: user.uid,
        username: username,
        email: email,
        address: address,
      );

      await _firebaseFirestore
          .collection('users')
          .doc(user.uid)
          .set(userModel.toJson());

      return true;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          throw AuthException('Email is already in use.');
        case 'invalid-email':
          throw AuthException('Invalid email address.');
        case 'weak-password':
          throw AuthException('The password provided is too weak.');
        default:
          throw AuthException('Sign Up Failed: ${e.message}');
      }
    }
  }

  Future<bool> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = userCredential.user;

      if (user == null) {
        throw AuthException('Login faild');
      }

      final doc =
          await _firebaseFirestore.collection('users').doc(user.uid).get();

      if (!doc.exists) {
        throw AuthException('User not found in Firestore');
      }

      return true;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          throw AuthException('No user found with this email.');
        case 'wrong-password':
          throw AuthException('Incorrect password.');
        case 'invalid-email':
          throw AuthException('Invalid email address.');
        default:
          throw AuthException('Sign In Failed: ${e.message}');
      }
    }
  }

  Future<bool> resetPassword({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);

      return true;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          throw AuthException('No user found with this email.');
        case 'invalid-email':
          throw AuthException('Invalid email address.');
        default:
          throw AuthException('Password Reset Failed: ${e.message}');
      }
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}

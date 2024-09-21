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
        throw Exception('User creation failed');
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
      throw Exception(e.message ?? 'Sign Up Failed');
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
        throw Exception('Login faild');
      }

      final doc =
          await _firebaseFirestore.collection('users').doc(user.uid).get();

      if (!doc.exists) {
        throw Exception('User not found in Firestore');
      }

      return true;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message ?? 'Sign In Failed');
    }
  }

  Future<void> resetPassword({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message ?? 'Password Reset Failded');
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}

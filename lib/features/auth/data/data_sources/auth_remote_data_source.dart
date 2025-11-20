import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:serve_home/core/errors/exception.dart';
import 'package:serve_home/core/errors/failure.dart';
import 'package:serve_home/features/auth/data/models/user_model.dart';

class AuthRemoteDataSource {
  Future<Either<Failure, Unit>> signUp({
    required String password,
    required UserModel userModel,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      final userCredential = await auth.createUserWithEmailAndPassword(
        email: userModel.email,
        password: password,
      );
      final firebaseUser = userCredential.user;
      if (firebaseUser != null) {
        UserModel updateUserModel = UserModel(
          name: userModel.name,
          phone: userModel.phone,
          email: userModel.email,
          id: firebaseUser.uid,
          role: userModel.role,
        );
        await firestore
            .collection('users')
            .doc(firebaseUser.uid)
            .set(updateUserModel.toMap());
      }
      return right(unit);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptionHandler(message: e.code);
    }
  }

  Future<Either<Failure, UserModel>> signIn({
    required String password,
    required String email,
  }) async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user;
      final doc = await firestore.collection('users').doc(user!.uid).get();
      log('${user.uid}');
      final data = doc.data();
      return right(UserModel.fromMap(data!));
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptionHandler(message: e.code);
    }
  }
}

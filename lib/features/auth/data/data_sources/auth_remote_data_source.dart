import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:serve_home/core/errors/exception.dart';
import 'package:serve_home/core/errors/failure.dart';
import 'package:serve_home/features/auth/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  Future<Either<Failure, Unit>> signIn({
    required String password,
    required String email,
  }) async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(unit);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptionHandler(message: e.code);
    }
  }

  Stream<UserModel> listenToUser(String idUser) {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(idUser)
        .snapshots()
        .map((snap) => UserModel.fromMap(snap.data()!));
  }

  Future<void> signOut() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signOut();
  }

  Future<void> saveLoginStatus(bool  isLoggedIn) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('isLoggedIn', isLoggedIn);
  }

  Future<bool> getLoginStatus() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool('isLoggedIn') ?? false;
  }

  Future<UserModel?> getUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if(pref.getBool('isLoggedIn')==null){
      return null ; 
    }
  else {
      return  UserModel(
      name: pref.getString('user_name')!,
      phone: pref.getString('user_phone')!,
      email: pref.getString('user_email')!,
      id: pref.getString('user_id'),
      password: pref.getString('user_password'),
    ) ;
    } 
  }

  Future<void> saveUser(UserModel user, String password) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('user_name', user.name);
    await pref.setString('user_email', user.email);
    await pref.setString('user_phone', user.phone);
    await pref.setString('user_id', user.id!);
    if (password.isNotEmpty) {
      await pref.setString('user_password', password);
    }
  }

  Future<void> updatePassword({required String newPassword}) async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    firebaseAuth.currentUser!.updatePassword(newPassword);
  }
}

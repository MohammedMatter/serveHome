import 'package:dartz/dartz.dart';
import 'package:serve_home/core/errors/failure.dart';
import 'package:serve_home/features/auth/data/models/user_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, Unit>> signUp({
    required String password,
    required UserModel userModel,
  });
  Future<Either<Failure, Unit>> signIn({
    required String password,
    required String email,
  });
  Future<void>saveLoginStatus(bool isLoggedIn) ; 
  Future<void>saveUser(UserModel user) ; 
  Future<UserModel>getUser() ; 
    Future<bool> getLoginStatus();
  Stream<UserModel> listenToUser(String idUser);
  Future<void> signOut();
}

import 'package:dartz/dartz.dart';
import 'package:serve_home/core/errors/failure.dart';
import 'package:serve_home/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:serve_home/features/auth/data/models/user_model.dart';
import 'package:serve_home/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRemoteDataSource _authRemoteDataSource = AuthRemoteDataSource();
  @override
  Future<Either<Failure, Unit>> signIn({
    required String password,
    required String email,
  }) {
    return _authRemoteDataSource.signIn(email: email, password: password);
  }

  @override
  Future<Either<Failure, Unit>> signUp({
    required String password,
    required UserModel userModel,
  }) {
    return _authRemoteDataSource.signUp(
      password: password,
      userModel: userModel,
    );
  }

  @override
  Stream<UserModel> listenToUser(String idUser) {
    return _authRemoteDataSource.listenToUser(idUser);
  }

  @override
  Future<void> signOut() {
    return _authRemoteDataSource.signOut();
  }

  @override
  Future<void> saveLoginStatus(bool isLoggedIn) {
    return _authRemoteDataSource.saveLoginStatus(isLoggedIn);
  }

  @override
  Future<bool> getLoginStatus() {
    return _authRemoteDataSource.getLoginStatus();
  }

  @override
  Future<UserModel> getUser() {
    return _authRemoteDataSource.getUser();
  }

  @override
  Future<void> saveUser(UserModel user) {
    return _authRemoteDataSource.saveUser(user);
  }
}

import 'package:dartz/dartz.dart';
import 'package:serve_home/core/errors/exception.dart';
import 'package:serve_home/core/errors/failure.dart';
import 'package:serve_home/features/auth/data/models/user_model.dart';
import 'package:serve_home/features/auth/data/repositories_impl/auth_repository_impl.dart';

class SignUpUseCase {
  AuthRepositoryImpl authRepositoryImpl = AuthRepositoryImpl();
  Future<Either<Failure, Unit>> call({
    required String password,
    required UserModel userModel,
  }) async {
    try {
      await authRepositoryImpl.signUp(password: password, userModel: userModel);
      return right(unit);
    } on FirebaseAuthExceptionHandler catch (e) {
      switch (e.message) {
        case 'weak-password':
          return left(
            FirebaseAuthFailure('weak-password , please put strong password'),
          );
        case 'email-already-in-use':
          return left(FirebaseAuthFailure('email-already-in-use'));
        case 'invalid-email':
          return left(FirebaseAuthFailure('invalid-email'));
        default:
          return left(
            FirebaseAuthFailure('Something went wrong, please try again'),
          );
      }
    }
  }
}

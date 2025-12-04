import 'package:dartz/dartz.dart';
import 'package:serve_home/core/errors/exception.dart';
import 'package:serve_home/core/errors/failure.dart';
import 'package:serve_home/features/auth/data/repositories_impl/auth_repository_impl.dart';

class SignInUseCase {
  AuthRepositoryImpl authRepositoryImpl = AuthRepositoryImpl();
  Future<Either<Failure, Unit>> call({
    required String email,
    required String password,
  }) async {
    try {
      return await authRepositoryImpl.signIn(password: password, email: email);
    } on FirebaseAuthExceptionHandler catch (e) {
      switch (e.message) {
        case 'invalid-credential':
          return left(FirebaseAuthFailure('Incorrect password or email'));
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

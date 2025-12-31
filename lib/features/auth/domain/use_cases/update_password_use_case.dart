import 'package:serve_home/features/auth/data/repositories_impl/auth_repository_impl.dart';

class UpdatePasswordUseCase {
  AuthRepositoryImpl authRepositoryImpl = AuthRepositoryImpl();
  Future<void> call({required String newPassword}) async {
    await authRepositoryImpl.updatePassword(newPassword: newPassword);
  }
}

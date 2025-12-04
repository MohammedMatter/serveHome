import 'package:serve_home/features/auth/data/models/user_model.dart';
import 'package:serve_home/features/auth/data/repositories_impl/auth_repository_impl.dart';

class ListenToUserUseCase {
  AuthRepositoryImpl authRepositoryImpl = AuthRepositoryImpl();

  Stream<UserModel> call(String idUser) {
    return authRepositoryImpl.listenToUser(idUser);
  }
}

import 'package:serve_home/features/profile/data/repositories_impl/profile_repositories_impl.dart';

class UpdateUserDataUseCase {
  ProfileRepositoriesImpl profileRepositoriesImpl = ProfileRepositoriesImpl();
  Future<void> call({
    required String idUser,
    required String name,
    required String email,
    required String phone,
  }) async {
    return profileRepositoriesImpl.updateUserData(
      idUser: idUser,
      name: name,
      email: email,
      phone: phone,
    );
  }
}

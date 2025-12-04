import 'package:serve_home/features/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:serve_home/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoriesImpl extends ProfileRepository {
  ProfileRemoteDataSource profileRemoteDataSource = ProfileRemoteDataSource();
  @override
  Future<void> updateUserData({
    required String idUser,
    required String name,
    required String email,
    required String phone,
  }) {
    return profileRemoteDataSource.updateUserData(
      idUser: idUser,
      name: name,
      email: email,
      phone: phone,
    );
  }
}

abstract class ProfileRepository {
    Future<void> updateUserData({
    required String idUser,
    required String name,
    required String email,
    required String phone,
  }) ;
}
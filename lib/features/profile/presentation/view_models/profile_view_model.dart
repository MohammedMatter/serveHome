import 'package:flutter/foundation.dart';

import 'package:serve_home/features/profile/domain/use_cases/update_user_data_use_case.dart';

class ProfileViewModel extends ChangeNotifier {
  UpdateUserDataUseCase updateUserDataUseCase;
  ProfileViewModel({required this.updateUserDataUseCase});
  Future<void> updateUserData({
    required String idUser,
    required String name,
    required String email,
    required String phone,
  }) async {
    await updateUserDataUseCase.call(
      idUser: idUser,
      name: name,
      email: email,
      phone: phone,
    );
  }
}

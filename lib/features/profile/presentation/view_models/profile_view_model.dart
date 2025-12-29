import 'package:flutter/foundation.dart';

import 'package:serve_home/features/profile/domain/use_cases/update_user_data_use_case.dart';

class ProfileViewModel extends ChangeNotifier {
  bool isLoading = false;
  UpdateUserDataUseCase updateUserDataUseCase;
  ProfileViewModel({required this.updateUserDataUseCase});
  Future<void> updateUserData({
    required String idUser,
    required String name,
    required String email,
    required String phone,
  }) async {
    isLoading = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 2));
    await updateUserDataUseCase.call(
      idUser: idUser,
      name: name,
      email: email,
      phone: phone,
    );
    isLoading = false;
    notifyListeners();
  }
}

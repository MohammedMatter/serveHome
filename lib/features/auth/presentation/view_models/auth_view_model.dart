import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/errors/failure.dart';
import 'package:serve_home/core/router/app_router.dart';
import 'package:serve_home/features/auth/data/models/user_model.dart';
import 'package:serve_home/features/auth/domain/use_cases/get_login_status_use_case.dart';
import 'package:serve_home/features/auth/domain/use_cases/get_user_use_case.dart';
import 'package:serve_home/features/auth/domain/use_cases/listen_to_user_use_case.dart';
import 'package:serve_home/features/auth/domain/use_cases/save_login_status_use_case.dart';
import 'package:serve_home/features/auth/domain/use_cases/save_user_use_case.dart';
import 'package:serve_home/features/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:serve_home/features/auth/domain/use_cases/sign_out_use_case.dart';
import 'package:serve_home/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:serve_home/features/auth/domain/use_cases/update_password_use_case.dart';
import 'package:serve_home/features/booking/presentation/view_models/booking_view_model.dart';
import 'package:serve_home/features/home/presentation/view_models/home_view_model.dart';
import 'package:serve_home/features/services/presentation/view_models/service_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthViewModel extends ChangeNotifier {
  bool isLoading = false;
  bool? isLoggedIn = false;
  String errorMessage = '';
  SignUpUseCase signUpUseCase;
  SignInUseCase signInUseCase;
  SignOutUseCase signOutUseCase;
  SaveLoginStatusUseCase saveLoginStatusUseCase;
  GetLoginStatusUseCase getLoginStatusUseCase;
  UserModel? _currentUser;
  UserModel? get user => _currentUser;
  ListenToUserUseCase listenToUserUseCase;
  SaveUserUseCase saveUserUseCase;
  GetUserUseCase getUserUseCase;
  UpdatePasswordUseCase updatePasswordUseCase;

  AuthViewModel({
    required this.updatePasswordUseCase,
    required this.saveUserUseCase,
    required this.getUserUseCase,
    required this.saveLoginStatusUseCase,
    required this.getLoginStatusUseCase,
    required this.signOutUseCase,
    required this.signUpUseCase,
    required this.signInUseCase,
    required this.listenToUserUseCase,
  }) {
    loadLoginStatus();
  }

  void reset(BuildContext context) {
    errorMessage = '';
    isLoading = false;
    isLoggedIn = false;
    Provider.of<BookingViewModel>(context, listen: false).reset();
    Provider.of<HomeViewModel>(context, listen: false).reset();
    Provider.of<ServiceViewModel>(context, listen: false).reset();

    notifyListeners();
  }

  Future<void> loadLoginStatus() async {
    _currentUser = await getUserUseCase.call();
    isLoggedIn = await getLoginStatusUseCase.call();
    notifyListeners();
  }

  Future<Either<Failure, Unit>> signUp({
    required String password,
    required UserModel userModel,
  }) async {
    isLoading = true;
    notifyListeners();
    final result = await signUpUseCase.call(
      password: password,
      userModel: userModel,
    );
    await saveLoginStatusUseCase.call(true);
    isLoggedIn = await getLoginStatusUseCase.call();
    await Future.delayed(Duration(seconds: 2));
    result.fold(
      (error) async {
        notifyListeners();
        errorMessage = error.message;
        isLoading = false;
      },
      (_) async {
        final idUser = FirebaseAuth.instance.currentUser!.uid;
        _currentUser = await getUserOnce(idUser);
        await saveUserUseCase.call(_currentUser!, password);
        await saveLoginStatusUseCase.call(true);

        errorMessage = '';
        isLoading = false;
        notifyListeners();
      },
    );
    notifyListeners();
    return result;
  }

  Future<Either<Failure, Unit>> signIn({
    required String password,
    required String email,
    required VoidCallback? onSuccess,
  }) async {
    isLoading = true;
    notifyListeners();
    final result = await signInUseCase.call(password: password, email: email);
    await Future.delayed(Duration(seconds: 2));

    result.fold(
      (error) {
        errorMessage = error.message;
        isLoading = false;
        notifyListeners();
      },
      (user) async {
        errorMessage = '';
        final idUser = FirebaseAuth.instance.currentUser!.uid;
        _currentUser = await getUserOnce(idUser);
        await saveUserUseCase.call(_currentUser!, password);
        await saveLoginStatusUseCase.call(true);
        isLoggedIn = await getLoginStatusUseCase.call();
        isLoading = false;
        if (onSuccess != null) onSuccess();
        notifyListeners();
      },
    );
    return result;
  }

  Future<UserModel> getUserOnce(String idUser) async {
    final auth = FirebaseFirestore.instance;
    final docRef = await auth.collection('users').doc(idUser).get();
    final data = docRef.data();
    log('data');
    log(data.toString());
    if (!docRef.exists || data == null) {
      throw Exception('User not found');
    }
    return UserModel.fromMap(data);
  }

  Future listenToUser({
    required String idUser,
    required String password,
  }) async {
    listenToUserUseCase.call(idUser).listen((user) async {
      log('User');
      log('---------------------');
      log(user.name);
      await loadUser(user, password);

      notifyListeners();
    });
  }

  Future loadUser(UserModel user, String? password) async {
    await saveUserUseCase.call(user, password ?? '');
    _currentUser = await getUserUseCase.call();
    log(_currentUser!.password!);
    log(_currentUser?.id! ?? 'NoId');
    notifyListeners();
  }

  Future<void> signOut() async {
    isLoading = true;
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.clear();
    errorMessage = '';
    notifyListeners();
    await saveLoginStatusUseCase.call(false);
    await Future.delayed(Duration(seconds: 2));
    await signOutUseCase.call();
    isLoading = false;
    notifyListeners();
  }

  Future<void> updatePassword(String newPassword) async {
    log('تم تحديث كلمة السر ');
    log('كلمة السر $newPassword');

    isLoading = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 4));
    await updatePasswordUseCase.call(newPassword: newPassword);
    await saveUserUseCase.call(user!, newPassword);
    _currentUser = await getUserUseCase.call();
    isLoading = false;
    notifyListeners();
  }
}

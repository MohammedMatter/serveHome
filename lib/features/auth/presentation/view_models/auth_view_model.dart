import 'dart:async';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:serve_home/core/errors/failure.dart';
import 'package:serve_home/features/auth/data/models/user_model.dart';
import 'package:serve_home/features/auth/domain/use_cases/listen_to_user_use_case.dart';
import 'package:serve_home/features/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:serve_home/features/auth/domain/use_cases/sign_up_use_case.dart';

class AuthViewModel extends ChangeNotifier {
  bool isLoading = false;
  String errorMessage = '';
  SignUpUseCase signUpUseCase;
  SignInUseCase signInUseCase;
  UserModel? _currentUser;
  UserModel? get user => _currentUser;
  ListenToUserUseCase listenToUserUseCase;
  AuthViewModel({
    required this.signUpUseCase,
    required this.signInUseCase,
    required this.listenToUserUseCase,
  });

  void reset() {
    errorMessage = '';
    isLoading = false;
    log('message');
    notifyListeners();
  }

  Future<Either<Failure, Unit>> signUp({
    required String password,
    required UserModel userModel,
  }) async {
    notifyListeners();
    isLoading = true;
    final result = await signUpUseCase.call(
      password: password,
      userModel: userModel,
    );
    await Future.delayed(Duration(seconds: 2));
    result.fold(
      (error) async {
        notifyListeners();
        errorMessage = error.message;
        isLoading = false;
      },
      (_) async {
        notifyListeners();
        errorMessage = '';
        isLoading = false;
      },
    );
    notifyListeners();
    return result;
  }

  Future<Either<Failure, Unit>> signIn({
    required String password,
    required String email,
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
      (user) {
        errorMessage = '';
        isLoading = false;
        final idUser = FirebaseAuth.instance.currentUser!.uid;
        listenToUser(idUser: idUser);
        notifyListeners();
      },
    );
    notifyListeners();
    return result;
  }

  void listenToUser({required String idUser}) {
    listenToUserUseCase.call(idUser).listen((user) {
      _currentUser = user;
      notifyListeners();
    });
  }
}

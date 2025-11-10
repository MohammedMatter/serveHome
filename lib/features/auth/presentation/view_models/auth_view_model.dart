import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:serve_home/core/errors/failure.dart';
import 'package:serve_home/features/auth/data/models/user_model.dart';
import 'package:serve_home/features/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:serve_home/features/auth/domain/use_cases/sign_up_use_case.dart';

class AuthViewModel extends ChangeNotifier {
  bool isLoading = false;
  String errorMessage = '';
  SignUpUseCase signUpUseCase;
  SignInUseCase signInUseCase;
  UserModel? _currentUser;
  UserModel? get user => _currentUser;
  AuthViewModel({required this.signUpUseCase, required this.signInUseCase});

  void setUser(UserModel userModel) {
    _currentUser = userModel;
    notifyListeners();
  }
void reset(){
   errorMessage = '';
   isLoading = false ; 
   log('message') ; 
   notifyListeners() ; 

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
    await Future.delayed(Duration(seconds: 2)) ;
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

  Future<Either<Failure, UserModel>> signIn({

    required String password,
    required String email,
  }) async {
    isLoading = true ; 
    notifyListeners() ; 
    final result = await signInUseCase.call(password: password, email: email);
      await Future.delayed(Duration(seconds: 2)) ;
    result.fold((error) {
      errorMessage = error.message ;
         isLoading = false ;  
      notifyListeners() ; 
    }, (user) {
      setUser(user);
      errorMessage = '';
      isLoading = false ; 
      return user;
    });
    notifyListeners();
    return result;
  }
}

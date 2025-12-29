import 'package:serve_home/features/auth/data/repositories_impl/auth_repository_impl.dart';

class SaveLoginStatusUseCase {
  AuthRepositoryImpl _authRepositoryImpl = AuthRepositoryImpl() ; 

  Future <void>call(bool isLoggedIn)async{
    await _authRepositoryImpl.saveLoginStatus(isLoggedIn) ; 
  }
}
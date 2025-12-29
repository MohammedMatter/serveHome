import 'package:serve_home/features/auth/data/repositories_impl/auth_repository_impl.dart';

class GetLoginStatusUseCase {
  AuthRepositoryImpl _authRepositoryImpl = AuthRepositoryImpl() ; 

  Future <bool>call()async{
    return await _authRepositoryImpl.getLoginStatus() ; 
  }
}
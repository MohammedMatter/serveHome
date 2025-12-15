import 'package:serve_home/features/auth/data/repositories_impl/auth_repository_impl.dart';

class SignOutUseCase {
  AuthRepositoryImpl authRepositoryImpl = AuthRepositoryImpl() ; 
  Future<void>call()async{
    return authRepositoryImpl.signOut() ; 
  }
}
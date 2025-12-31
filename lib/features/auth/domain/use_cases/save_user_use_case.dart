import 'package:serve_home/features/auth/data/models/user_model.dart';
import 'package:serve_home/features/auth/data/repositories_impl/auth_repository_impl.dart';

class SaveUserUseCase {
  AuthRepositoryImpl authRepositoryImpl = AuthRepositoryImpl() ; 
  Future <void>call(UserModel user , String password)async{
    await authRepositoryImpl.saveUser(user , password) ; 
  }
}
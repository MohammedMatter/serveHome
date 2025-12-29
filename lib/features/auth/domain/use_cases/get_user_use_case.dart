import 'package:serve_home/features/auth/data/models/user_model.dart';
import 'package:serve_home/features/auth/data/repositories_impl/auth_repository_impl.dart';

class GetUserUseCase {
  AuthRepositoryImpl authRepositoryImpl = AuthRepositoryImpl();
    Future <UserModel>call()async{
   return await    authRepositoryImpl.getUser() ; 
  }
}

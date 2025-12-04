import 'package:serve_home/features/services/data/repositories_impl/services_repositories_impl.dart';
import 'package:serve_home/features/services/domain/entities/category.dart';

class GetCategoriesUseCase {
ServicesRepositoriesImpl servicesRepositoriesImpl = ServicesRepositoriesImpl() ; 
List<Category>call(){
  return servicesRepositoriesImpl.getCategories() ; 
}


}
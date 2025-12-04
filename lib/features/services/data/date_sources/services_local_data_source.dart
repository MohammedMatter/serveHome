import 'package:serve_home/features/services/domain/entities/category.dart';
class ServicesLocalDataSource {
  List<Category> categories = [
  Category(
    name: 'Cleaning',
    description: 'Professional home and office cleaning services to keep your space spotless and hygienic.',
    image: 'assets/images/categories/cleaning_service.png',
  ),
  Category(
    name: 'Decorating',
    description: 'Expert decorating services to transform your space with style, color, and creativity.',
    image: 'assets/images/categories/decorating.png',
  ),
  Category(
    name: 'Electrical',
    description: 'Reliable electrical services including installation, repair, and maintenance for your home or office.',
    image: 'assets/images/categories/electrical_service.png',
  ),
  Category(
    name: 'Maintenance',
    description: 'Comprehensive home and office maintenance services to ensure everything runs smoothly.',
    image: 'assets/images/categories/maintenance.png',
  ),
  Category(
    name: 'Plumbing',
    description: 'Expert plumbing solutions for installation, repair, and emergency plumbing issues.',
    image: 'assets/images/categories/plumbing_service.png',
  ),
];

List<Category> getCategories(){
  return categories ; 
}
}


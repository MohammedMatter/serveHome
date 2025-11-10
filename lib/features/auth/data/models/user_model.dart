import 'package:serve_home/features/auth/domain/entities/user_app.dart';

class UserModel extends UserApp {
  UserModel({
    required super.name,
    required super.phone,
    required super.email,
     super.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'id': id,
    };
  }

  factory UserModel.fromMap(Map map) {
    return UserModel(
      name: map['name'],
      phone: map['phone'],
      email: map['email'],
      id: map['id'],
    );
  }
}

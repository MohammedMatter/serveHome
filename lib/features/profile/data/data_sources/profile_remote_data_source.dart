import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileRemoteDataSource {
    Future<void> updateUserData({
    required String idUser,
    required String name,
    required String email,
    required String phone,
  }) async {
    FirebaseFirestore.instance.collection('users').doc(idUser).update({
      'name': name,
      'email': email,
      'phone': phone,
    });
  }
}
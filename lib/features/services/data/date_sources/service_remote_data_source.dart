import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:serve_home/features/services/data/models/service_model.dart';

class ServiceRemoteDataSource {
  Future addService(ServiceModel serviceModel) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final docRef = await firestore.collection('Services').doc();
    final idService = docRef.id;
    docRef.set({...serviceModel.toMap(), 'id': idService});
  }

  Future<List<ServiceModel>> getServices() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    List<ServiceModel> data = [];
    try {
      final snapShot = await firebaseFirestore.collection('Services').get();

      for (var element in snapShot.docs) {
        data.add(ServiceModel.fromMap(element.data()));
      }
    }  catch (e) {
      log('---- ${e}');
    }

    return data;
  }

  Future deleteService({required ServiceModel serviceModel}) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    await firebaseFirestore
        .collection('Services')
        .doc(serviceModel.id)
        .delete();
  }

  Future updateService({required ServiceModel serviceModel}) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    log('///${serviceModel.id}');
    await firebaseFirestore.collection('Services').doc(serviceModel.id).update({
      'name': serviceModel.name,
      'description': serviceModel.description,
      'price': serviceModel.price,
      'time': serviceModel.time,
      'categoryImageUrl': serviceModel.categoryImageUrl,
      'creatdAt': DateTime.now().toString(),
    });
  }
}

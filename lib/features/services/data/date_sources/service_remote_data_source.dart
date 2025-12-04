import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:serve_home/features/services/data/models/service_model.dart';

class ServiceRemoteDataSource {
  Future addService(ServiceModel serviceModel) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final docRef = firestore.collection('Services').doc();
    final idService = docRef.id;
    docRef.set({...serviceModel.toMap(), 'id': idService});

    return idService;
  }

  Future<List<ServiceModel>> getServices() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    List<ServiceModel> data = [];
    try {
      final snapShot = await firebaseFirestore
          .collection('Services')
          .get(GetOptions(source: Source.serverAndCache));
      if (snapShot.metadata.isFromCache) {
        log('Data is from cache');
      } else {
        log('Data is From Server');
      }
      for (var element in snapShot.docs) {
        data.add(ServiceModel.fromMap(element.data()));
      }
    } catch (e) {
      log('---- $e');
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
    log('/+*${serviceModel.id}');
    await firebaseFirestore.collection('Services').doc(serviceModel.id).update({
      'name': serviceModel.name,
      'description': serviceModel.description,
      'price': serviceModel.price,
      'time': serviceModel.time,
      'category': serviceModel.category,
      'categoryImageUrl': serviceModel.categoryImageUrl,
      'creatdAt': DateTime.now().toString(),
    });
  }
}

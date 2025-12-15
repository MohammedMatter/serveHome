import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:serve_home/features/notification/data/models/notification_model.dart';

class NotificationRemoteDataSource {
  Future<void> addNotification({
    required String idUser,
    required NotificationModel notification,
  }) async {
 
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final collectionReference =
        firestore
            .collection('users')
            .doc(idUser)
            .collection('notifications')
            .doc();

    final idReferance = collectionReference.id;
    collectionReference.set({...notification.toMap(), 'id': idReferance});
  }

  Future<void> markAsRead({
    required String idUser,
    required String idNotification,
  }) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    await firestore
        .collection('users')
        .doc(idUser)
        .collection('notifications')
        .doc(idNotification)
        .update({'read': true});
  }

  Stream<List<NotificationModel>> listenToNotifications(String idUser) {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(idUser)
        .collection('notifications')
        .orderBy('createAt', descending: true)
        .snapshots(source: ListenSource.defaultSource)
        .map(
          (snapShot) =>
              snapShot.docs
                  .map((doc) => NotificationModel.fromMap(doc.data()))
                  .toList(),
        );
  }
}

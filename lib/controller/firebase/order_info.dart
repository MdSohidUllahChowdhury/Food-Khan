import 'package:cloud_firestore/cloud_firestore.dart';

class OrderInfo {
  paymentSteps(Map<String, dynamic> collection, String id) {
    FirebaseFirestore.instance
        .collection('User Payment Information')
        .doc(id)
        .set(collection);
  }
}

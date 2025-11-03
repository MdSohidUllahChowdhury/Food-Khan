import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  Future<void> authInfo(Map<String, dynamic> collection, String id) async {
    await FirebaseFirestore.instance
        .collection("Auth User Informatin")
        .doc(id)
        .set(collection);
  }
}

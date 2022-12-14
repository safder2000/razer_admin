import 'package:cloud_firestore/cloud_firestore.dart';

class DeleteProduct {
  static deleteProduct({required String id, required String category}) {
    final docProduct = FirebaseFirestore.instance
        .collection('categories')
        .doc(category)
        .collection(category)
        .doc(id);
    final deletefromall = FirebaseFirestore.instance
        .collection('categories')
        .doc('all')
        .collection('all')
        .doc(id);
    docProduct.delete();
    deletefromall.delete();
  }
}

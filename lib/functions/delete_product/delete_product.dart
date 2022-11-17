import 'package:cloud_firestore/cloud_firestore.dart';

class DeleteProduct {
  static deleteProduct({required String id}) {
    final docProduct =
        FirebaseFirestore.instance.collection('products').doc(id);
    docProduct.delete();
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:razer_admin/model/product_model.dart';

Stream<List<Product>> readProducts() => FirebaseFirestore.instance
    .collection('products')
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => Product.fromJson(doc.data())).toList());

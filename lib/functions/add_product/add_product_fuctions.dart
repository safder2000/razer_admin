import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:razer_admin/model/product_model.dart';

Future addProduct({
  required String catogory,
  required String name,
  required String description,
  required String spec,
  String price = '1',
  String newPrice = '1',
  String quantity = '1',
  String rating = '1',
  required List colors,
  required List images,
}) async {
  final docProduct = FirebaseFirestore.instance
      .collection('categories')
      .doc(catogory)
      .collection(catogory)
      .doc();
  log('adding product to $catogory');
  final Product product = Product(
    id: docProduct.id,
    name: name,
    description: description,
    spec: spec,
    price: double.parse(price),
    quantity: double.parse(quantity),
    colors: colors,
    rating: double.parse(rating),
    images: images,
    category: catogory,
  );
  final json = product.toJson();
  log('befre adding');
  final allProduc = FirebaseFirestore.instance
      .collection('categories')
      .doc('all')
      .collection('all')
      .doc(docProduct.id);
  await docProduct.set(json);
  await allProduc.set(json);

  log('added');
}

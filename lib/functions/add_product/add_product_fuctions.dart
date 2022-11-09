import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:razer_admin/model/product_model.dart';

Future addProduct({
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
  final docProduct = FirebaseFirestore.instance.collection('products').doc();

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
  );
  final json = product.toJson();
  log('befre adding');

  await docProduct.set(json);

  log('added');
}

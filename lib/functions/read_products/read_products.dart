import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:razer_admin/application/add_product/add_product_bloc.dart';
import 'package:razer_admin/model/category_model.dart';
import 'package:razer_admin/model/product_model.dart';

Stream<List<Product>> readProducts(String category) {
  return FirebaseFirestore.instance
      .collection('categories')
      .doc(category)
      .collection(category)
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Product.fromJson(doc.data())).toList());
}

fetchCatagory() async {
  try {
    final DocumentSnapshot<Map<String, dynamic>> catagoryQuery =
        await FirebaseFirestore.instance
            .collection('products')
            .doc('categories')
            .get();
    // final QuerySnapshot<Map<String, dynamic>> catagoryQuery =
    //     await FirebaseFirestore.instance.collection('products').get();
    catagoryQuery.data();
    final catogory = catagoryQuery.data();
    // .map((products) => CategoryModel.fromSnapshot(products))

    log(catogory.toString());
  } catch (e) {
    print("somthing went wrong >> $e");
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  CategoryModel({required this.products, required this.id});
  String id;
  List products;

  static CategoryModel fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json['id'],
        products: json['products'],
      );
  // CategoryModel.fromSnapshot(
  //     Map<String, dynamic> snapshot)
  //     : id = snapshot.id,
  //       products = [];
}

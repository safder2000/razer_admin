import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:razer_admin/model/product_model.dart';
import 'package:razer_admin/presentation/view_product/screen_order_summary.dart';

class ViewProduct extends StatelessWidget {
  ViewProduct({super.key, required this.docKey});
  String docKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<Product?>(
        future: readProduct(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Somthing wnt wrong');
          } else if (snapshot.hasData) {
            final product = snapshot.data;
            return product == null
                ? Center(
                    child: Text('No user found'),
                  )
                : ProductViewPage(
                    product: product,
                  );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<Product?> readProduct() async {
    final docProduct =
        FirebaseFirestore.instance.collection('products').doc(docKey);
    final snapshot = await docProduct.get();
    if (snapshot.exists) {
      return Product.fromJson(snapshot.data()!);
    }
  }
}

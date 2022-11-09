import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:razer_admin/model/product_model.dart';
import 'package:razer_admin/presentation/add_product/add_product_screen.dart';
import 'package:razer_admin/presentation/home/widgets/listed_item.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => AddProduct(),
                  ),
                );
              },
              icon: const Icon(Icons.add))
        ]),
        body: StreamBuilder<List<Product>>(
            stream: readProducts(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Somthing went wrong! ${snapshot.data} ');
              } else if (snapshot.hasData) {
                final products = snapshot.data!;
                return ListView(
                  children: products.map(buildProduct).toList(),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }

  Widget buildProduct(Product product) => ListedItem(
        title: product.name,
        image: product.images[0],
      );

  Stream<List<Product>> readProducts() => FirebaseFirestore.instance
      .collection('products')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Product.fromJson(doc.data())).toList());
}

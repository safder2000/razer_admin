import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:razer_admin/core/constants.dart';
import 'package:razer_admin/model/product_model.dart';
import 'package:razer_admin/presentation/add_product/add_product_screen.dart';
import 'package:razer_admin/presentation/home/widgets/listed_item.dart';

import '../../functions/read_products/read_products.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black, actions: [
        IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => AddProduct(),
                ),
              );
            },
            icon: const Icon(
              Icons.add,
              size: 35,
            )),
        width_10,
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
        },
      ),
    );
  }

  Widget buildProduct(Product product) => ListedItem(
        title: product.name.isEmpty ? 'No title given' : product.name,
        image: product.images.isEmpty
            ? 'https://media.istockphoto.com/id/1325006592/photo/one-closed-cardboard-box.jpg?b=1&s=170667a&w=0&k=20&c=D0i7ktndB9WqzmK9QvwDpeaEkS7_gs6tJ4k_ZTh-bsI='
            : product.images[0],
        description: product.description.isEmpty
            ? 'No description given'
            : product.description,
        price: product.price,
        quantity: product.quantity,
        rating: product.rating,
        product: product,
      );
}

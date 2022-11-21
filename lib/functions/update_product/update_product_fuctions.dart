import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:razer_admin/model/product_model.dart';

class UpdateProductFunctions {
  static updateProduct({
    required Product product,
    required final context,
    required String name,
    required String description,
    required String spec,
    required String price,
    String newPrice = '0',
    String quantity = '0',
    String rating = '0',
    required List colors,
    required List images,
  }) async {
    log(name);
    final docProduct = FirebaseFirestore.instance
        .collection('categories')
        .doc(product.category)
        .collection(product.category)
        .doc(product.id);
    // await UpdateProductFunctions.updateProduct(
    //   name: event.name_controller.trim().isEmpty
    //       ? state.product.name
    //       : event.name_controller,
    //   description: event.description_controller.trim().isEmpty
    //       ? state.product.description
    //       : event.description_controller,
    //   spec: event.spec_controller.trim() == ''
    //       ? state.product.spec
    //       : event.spec_controller,
    //   price: event.price_controller.trim() == ''
    //       ? '${state.product.price}'
    //       : event.price_controller,
    //   quantity: event.quantity_controller.trim() == ''
    //       ? '${state.product.quantity}'
    //       : event.quantity_controller,
    //   rating: event.rating_controller.trim() == ''
    //       ? '${state.product.rating}'
    //       : event.rating_controller,
    //   colors: state.product.colors,
    //   images: state.product.images,
    //   id: event.id,
    //   context: event.context,
    // );
    final Product updatedProduct = Product(
      id: docProduct.id,
      name: name,
      description: description,
      spec: spec,
      price: price == '0' ? product.price : double.parse(price),
      quantity: quantity == '0' ? product.quantity : double.parse(quantity),
      colors: colors,
      rating: rating == '0' ? product.rating : double.parse(rating),
      images: images,
      category: product.category,
    );
    // log('Updating.... ${product.id}');

    final json = updatedProduct.toJson();
    final allproducts = FirebaseFirestore.instance
        .collection('categories')
        .doc('all')
        .collection('all')
        .doc(product.id);
    await docProduct.set(json);
    await allproducts.set(json);

    productUpdatedAlert(context, updatedProduct.name);
    // log('Updated ${product.name}');
  }

  static productUpdatedAlert(BuildContext context, String name) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.white,
      content: Text(
        "$name updated.",
        style: TextStyle(fontSize: 20),
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

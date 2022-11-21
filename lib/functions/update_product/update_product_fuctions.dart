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
    String price = '0',
    String newPrice = '0',
    String quantity = '0',
    String rating = '0',
    required List colors,
    required List images,
  }) async {
    log('update function reached');
    final docProduct =
        FirebaseFirestore.instance.collection('products').doc(product.id);
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
      name: 'gg',
      description: description,
      spec: spec,
      price: double.parse(price),
      quantity: double.parse(quantity),
      colors: colors,
      rating: double.parse(rating),
      images: images,
      category: '',
    );
    // log('Updating.... ${product.id}');

    final json = updatedProduct.toJson();

    await docProduct.update(json);

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

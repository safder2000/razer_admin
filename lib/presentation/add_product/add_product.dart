import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:razer_admin/model/product_model.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width * 0.95;
    final name_controller = TextEditingController();
    final price_controller = TextEditingController();
    final description_controller = TextEditingController();
    final altPrice_controller = TextEditingController();
    final spec_controller = TextEditingController();
    final quantity_controller = TextEditingController();
    final rating_controller = TextEditingController();
    List<String> colors = [];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: Colors.green),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    height: screenWidth * 0.6,
                    width: screenWidth,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              'https://assets2.razerzone.com/images/pnx.assets/381e915d58d2b9759725c30a9f2c3a0f/razer-blade-15-2022-laptop-500x500.jpg',
                            ))),
                  ),
                  const Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 20,
                      child: Icon(Icons.add),
                    ),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          textfield(hint: 'Name of the Product', controller: name_controller),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              textfield(
                  hint: 'Price',
                  keybord: TextInputType.number,
                  fieldWidth: MediaQuery.of(context).size.width * 0.45,
                  controller: price_controller),
              textfield(
                  hint: 'alt Price',
                  keybord: TextInputType.number,
                  fieldWidth: MediaQuery.of(context).size.width * 0.45,
                  controller: altPrice_controller),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          textfield(
              hint: 'Description',
              lines: 5,
              controller: description_controller),
          const SizedBox(
            height: 20,
          ),
          textfield(hint: 'Specification', controller: spec_controller),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  addProduct(
                    name: name_controller.text,
                    description: description_controller.text,
                    spec: spec_controller.text,
                    price: price_controller.text,
                    quantity: quantity_controller.text,
                    rating: rating_controller.text,
                    colors: colors,
                  );
                },
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    textStyle: const TextStyle(fontSize: 20),
                    backgroundColor: Colors.green),
                child: const Text('  ADD  '),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
        ]),
      ),
    );
  }

  Row textfield(
      {int lines = 1,
      String hint = '',
      TextInputType keybord = TextInputType.text,
      required TextEditingController controller,
      double fieldWidth = 380}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: fieldWidth,
          child: TextFormField(
            controller: controller,
            keyboardType: keybord,
            minLines: lines,
            maxLines: 10,
            textAlign: TextAlign.start,
            style: const TextStyle(color: Colors.white, fontSize: 16),
            decoration: InputDecoration(
                // errorText: _validate ? 'wrong password' : null,
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 1.0),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white60, width: 1.0),
                ),
                label: Text(
                  hint,
                  style: const TextStyle(color: Colors.white70),
                ),
                hintStyle: const TextStyle(color: Colors.white70)),
          ),
        ),
      ],
    );
  }

  Future addProduct({
    required String name,
    required String description,
    required String spec,
    required String price,
    String newPrice = '0',
    required String quantity,
    required String rating,
    required List colors,
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
    );
    final json = product.toJson();

    await docProduct.set(json);

    log('added');
  }
}

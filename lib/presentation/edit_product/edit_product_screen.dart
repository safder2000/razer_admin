import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:razer_admin/application/edit_product/edit_product_bloc.dart';
import 'package:razer_admin/core/constants.dart';
import 'package:razer_admin/model/product_model.dart';
import 'package:razer_admin/presentation/Edit_product/widgets/text_fields_widget.dart';

import 'package:razer_admin/presentation/edit_product/widgets/edit_image_widget.dart';

import 'widgets/edit_varients_widget.dart';

class EditProduct extends StatelessWidget {
  EditProduct({super.key, required this.product});
  Product product;

  final name_controller = TextEditingController();
  final price_controller = TextEditingController();
  final description_controller = TextEditingController();
  final altPrice_controller = TextEditingController();
  final spec_controller = TextEditingController();
  final quantity_controller = TextEditingController();
  final rating_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    log('product id == ${product.id}');
    BlocProvider.of<EditProductBloc>(context)
        .add(LoadOldData(product: product));
    final screenWidth = MediaQuery.of(context).size.width * 0.95;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Edit Product',
          style: TextStyle(color: Colors.green),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: [
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 40,
          ),
          editTextfield(
              hint: 'Name',
              controller: name_controller,
              initialValue: '${product.name}'),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              editTextfield(
                  hint: 'Price',
                  keybord: TextInputType.number,
                  fieldWidth: MediaQuery.of(context).size.width * 0.45,
                  controller: price_controller,
                  initialValue: '${product.price}'),
              editTextfield(
                  hint: 'new Price',
                  keybord: TextInputType.number,
                  fieldWidth: MediaQuery.of(context).size.width * 0.45,
                  controller: altPrice_controller,
                  initialValue: '${product.price}'),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          editTextfield(
              hint: 'Description',
              lines: 5,
              controller: description_controller,
              initialValue: '${product.description}'),
          const SizedBox(
            height: 20,
          ),
          editTextfield(
              hint: 'Specification',
              controller: spec_controller,
              initialValue: '${product.spec}'),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              editTextfield(
                  hint: 'Quantity',
                  keybord: TextInputType.number,
                  fieldWidth: MediaQuery.of(context).size.width * 0.45,
                  controller: quantity_controller,
                  initialValue: '${product.quantity}'),
              editTextfield(
                  hint: '${product.rating}',
                  keybord: TextInputType.number,
                  fieldWidth: MediaQuery.of(context).size.width * 0.45,
                  controller: rating_controller,
                  initialValue: '${product.rating}'),
            ],
          ),
          height_20,
          const EditVarientsWidget(),
          height_20,
          const EditImageWidget(),
          height_20,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<EditProductBloc>(context).add(UpdateData(
                    name_controller: name_controller.text,
                    description_controller: description_controller.text,
                    spec_controller: spec_controller.text,
                    price_controller: price_controller.text,
                    quantity_controller: quantity_controller.text,
                    rating_controller: rating_controller.text,
                    context: context,
                    product: product,
                  ));
                  // Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    textStyle: const TextStyle(fontSize: 20),
                    backgroundColor: Colors.green),
                child: const Text('  UPDATE  '),
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
}

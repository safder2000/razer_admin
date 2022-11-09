import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:razer_admin/application/add_product/add_product_bloc.dart';
import 'package:razer_admin/core/constants.dart';
import 'package:razer_admin/model/product_model.dart';
import 'package:razer_admin/presentation/add_product/widgets/add_image_widget.dart';
import 'package:razer_admin/presentation/add_product/widgets/add_varients_widget.dart';
import 'package:razer_admin/presentation/add_product/widgets/text_fields_widget.dart';

class AddProduct extends StatelessWidget {
  AddProduct({super.key});
  final name_controller = TextEditingController();
  final price_controller = TextEditingController();
  final description_controller = TextEditingController();
  final altPrice_controller = TextEditingController();
  final spec_controller = TextEditingController();
  final quantity_controller = TextEditingController();
  final rating_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width * 0.95;

    log('reloaded');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Add New Product',
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
                  hint: 'New Price',
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
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              textfield(
                  hint: 'Quantity',
                  keybord: TextInputType.number,
                  fieldWidth: MediaQuery.of(context).size.width * 0.45,
                  controller: quantity_controller),
              textfield(
                  hint: 'Rating',
                  keybord: TextInputType.number,
                  fieldWidth: MediaQuery.of(context).size.width * 0.45,
                  controller: rating_controller),
            ],
          ),
          height_20,
          const AddVarientsWidget(),
          height_20,
          AddImageWidget(),
          height_20,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<AddProductBloc>(context).add(SaveToDB(
                    name_controller: name_controller.text,
                    description_controller: description_controller.text,
                    spec_controller: spec_controller.text,
                    price_controller: price_controller.text,
                    quantity_controller: quantity_controller.text,
                    rating_controller: rating_controller.text,
                  ));
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
}

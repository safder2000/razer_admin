import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:razer_admin/application/add_product/add_product_bloc.dart';
import 'package:razer_admin/core/constants.dart';

import 'package:razer_admin/presentation/add_product/widgets/add_image_widget.dart';
import 'package:razer_admin/presentation/add_product/widgets/add_varients_widget.dart';
import 'package:razer_admin/presentation/add_product/widgets/color_picker_widget.dart';
import 'package:razer_admin/presentation/add_product/widgets/text_fields_widget.dart';

class AddProduct extends StatelessWidget {
  AddProduct({super.key});
  final name_controller = TextEditingController();
  String? catogory;
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
          BlocBuilder<AddProductBloc, AddProductState>(
            builder: (context, state) {
              return DropdownButton<String>(
                focusColor: Colors.amber,
                iconEnabledColor: Colors.amber,
                dropdownColor: Colors.grey,
                items: <String>[
                  'laptops',
                  'audio',
                  'chairs',
                  'components',
                  'console',
                  'gear',
                  'keyboards',
                  'mice',
                  'mobile',
                  'streaming'
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  catogory = value;
                  log('button rebuilded');

                  BlocProvider.of<AddProductBloc>(context)
                      .add(Catogory(catogory: catogory ?? 'laptops'));
                },
                hint: Text(
                  state.catogory,
                  style: TextStyle(color: Colors.white),
                ),
              );
            },
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
                  hint: 'Rating (0-5)',
                  keybord: TextInputType.number,
                  fieldWidth: MediaQuery.of(context).size.width * 0.45,
                  controller: rating_controller),
            ],
          ),
          height_20,
          const AddVarientsWidget(),
          height_20,
          const AddImageWidget(),
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
                    catogory: catogory ?? 'laptops',
                  ));
                  productAddedAlert(context, name_controller.text);
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

  productAddedAlert(BuildContext context, String name) {
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
      content: Text("$name added to database."),
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

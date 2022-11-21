import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:razer_admin/application/main_bloc/main_page_bloc.dart';

import 'package:razer_admin/core/constants.dart';
import 'package:razer_admin/model/product_model.dart';
import 'package:razer_admin/presentation/add_product/add_product_screen.dart';
import 'package:razer_admin/presentation/home/widgets/listed_item.dart';

import '../../functions/read_products/read_products.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainPageBloc, MainPageState>(
      builder: (context, state) {
        String? category;

        return Scaffold(
          appBar: AppBar(backgroundColor: Colors.green, actions: [
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
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.green,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.56,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'Category : ',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        DropdownButton<String>(
                          dropdownColor: Color.fromARGB(255, 213, 213, 213),
                          items: <String>[
                            'all',
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
                            category = value;
                            log('button rebuilded');

                            BlocProvider.of<MainPageBloc>(context).add(
                                DisplayCategory(
                                    category: category ?? 'laptops'));
                          },
                          hint: Text(
                            state.category,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              StreamBuilder<List<Product>>(
                stream: readProducts(state.category),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return SizedBox(
                        height: MediaQuery.of(context).size.width,
                        child: Center(
                            child: Text(
                                'Somthing went wrong! ${snapshot.data} ')));
                  } else if (snapshot.hasData) {
                    final products = snapshot.data!;
                    if (products.isEmpty) {
                      return SizedBox(
                          height: MediaQuery.of(context).size.width,
                          child: Center(
                            child:
                                Text('There is no product under this category'),
                          ));
                    } else {
                      return ListView(
                        shrinkWrap: true,
                        children: products.map(buildProduct).toList(),
                      );
                    }
                  } else {
                    return SizedBox(
                      height: MediaQuery.of(context).size.width,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildProduct(Product product) => ListedItem(
        title: product.name.isEmpty ? 'No title given' : product.name,
        image: product.images.isEmpty
            ? 'https://media.istockphoto.com/id/1325006592/photo/one-closed-cardboard-box.jpg?b=1&s=170667a&w=0&k=20&c=D0i7ktndB9WqzmK9QvwDpeaEkS7_gs6tJ4k_ZTh-bsI='
            : product.images[0],
        product: product,
      );
}

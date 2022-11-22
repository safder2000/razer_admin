import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:razer_admin/application/search/search_bloc.dart';
import 'package:razer_admin/presentation/home/widgets/listed_item.dart';

import '../../model/product_model.dart';

class ScreenSearch extends StatelessWidget {
  ScreenSearch({super.key});
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: TextField(
          controller: searchController,
          onChanged: (value) {
            context.read<SearchBloc>().add(SearchSong(search_text: value));
          },
          decoration: InputDecoration(
            hintText: 'Product title/name',
            suffixIcon: IconButton(
              onPressed: searchController.clear,
              icon: Icon(
                Icons.clear,
                color: Color.fromARGB(222, 1, 64, 64),
              ),
            ),
          ),
        ),
      ),
      body: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          if (state.productList.isEmpty) {
            return Center(
              child: Text(
                'No Product with this name',
                style: TextStyle(color: Colors.white),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: state.productList.length,
              itemBuilder: (BuildContext context, int index) {
                return buildProduct(state.productList[index]);
              },
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
        product: product,
      );
}

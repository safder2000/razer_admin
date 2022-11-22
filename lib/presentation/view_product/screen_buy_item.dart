import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:razer_admin/core/constants.dart';
import 'package:razer_admin/model/product_model.dart';
import 'package:razer_admin/presentation/view_product/widgets/varients_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ViewSingleProduct extends StatelessWidget {
  ViewSingleProduct({super.key, required this.product});
  Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Product'),
        actions: [],
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          CarouselSlider(
            options: CarouselOptions(height: 400.0),
            items: product.images.map((i) {
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                // physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: product.images.length,
                itemBuilder: (BuildContext context, int index) =>
                    imageContainer(
                  context,
                  product.images[index],
                  index,
                  product.images.length,
                ),
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                  width: 10,
                ),
              );
            }).toList(),
          ),
          // Container(
          //   color: Color.fromARGB(19, 255, 255, 255),
          //   height: 250,
          //   child: ListView.separated(
          //     scrollDirection: Axis.horizontal,
          //     // physics: const NeverScrollableScrollPhysics(),
          //     shrinkWrap: true,
          //     itemCount: product.images.length,
          //     itemBuilder: (BuildContext context, int index) => imageContainer(
          //         context, product.images[index], index, product.images.length),
          //     separatorBuilder: (BuildContext context, int index) => SizedBox(
          //       width: 10,
          //     ),
          //   ),
          // ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.93,
                  child: Text(
                    " ${product.name}",
                    overflow: TextOverflow.clip,
                    style: TextStyle(fontSize: 23),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('description :',
                    style: TextStyle(
                      fontSize: 16,
                    )),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.93,
                  child: Text(
                    product.description,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                        fontSize: 15, color: Colors.white70, height: 1.4),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('specification :',
                    style: TextStyle(
                      fontSize: 16,
                    )),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.93,
                  child: Text(
                    "${product.spec}",
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                        fontSize: 15, color: Colors.white70, height: 1.4),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Divider(
            color: Colors.white,
          ),
          Container(
            height: 40,
            color: Colors.white10,
            child: Center(
              child: Row(
                children: [
                  Text(
                    '  Price : ',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    'US  \$${product.price}',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            color: Colors.white,
          ),
          VarientsWidget(
            product: product,
          ),
          Divider(
            color: Colors.white,
          ),
          SizedBox(
            height: 15,
          ),
          Text('   Rating :',
              style: TextStyle(
                fontSize: 16,
              )),
          height_10,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: RatingBarIndicator(
              rating: product.rating,
              itemBuilder: (context, index) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              itemCount: 5,
              itemSize: 35.0,
              direction: Axis.horizontal,
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    // BlocProvider.of<CartBloc>(context)
                    //     .add(AddToCart(product: product, context: context));
                  },
                  child: Container(
                    height: 60,
                    color: Colors.white,
                    child: Center(
                      child: Text(
                        'Edit',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute<void>(
                    //     builder: (BuildContext context) => ScreenOederSummery(),
                    //   ),
                    // );
                  },
                  child: Container(
                    height: 60,
                    color: Colors.amber,
                    child: Center(
                      child: Text(
                        'Remove',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  imageContainer(context, imgUrl, index, total) {
    final srcWidth = MediaQuery.of(context).size.width * 0.9;
    return Stack(children: [
      Container(
        width: srcWidth,
        height: srcWidth * 0.7,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 0, 0, 0),
          image: DecorationImage(
            image: NetworkImage(imgUrl),
          ),
        ),
      ),
      Positioned(
        bottom: 5,
        right: 5,
        child: GestureDetector(
          onTap: () {},
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 20,
            child: Text('${index + 1}/$total'),
          ),
        ),
      )
    ]);
  }
}

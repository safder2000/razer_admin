import 'package:flutter/material.dart';
import 'package:razer_admin/model/product_model.dart';

import 'package:razer_admin/presentation/view_product/widgets/deliver_to.dart';
import 'package:razer_admin/presentation/view_product/widgets/items.dart';
import 'package:razer_admin/presentation/view_product/widgets/price_details.dart';

import '../../core/constants.dart';

class ProductViewPage extends StatelessWidget {
  ProductViewPage({super.key, required this.product});
  Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'Order Summary',
            style: TextStyle(
                color: Colors.green, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          actions: []),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(color: Colors.green, height: 0),
          height_10,
          height_10,
          const Text(
            '     Deliver to :',
            style: TextStyle(fontSize: 17),
          ),
          const DeliverTo(),
          height_10,
          const Item(),
          height_10,
          const PriceDetails(),
          const Spacer(),
          Row(
            children: [
              const Expanded(
                child: SizedBox(
                  child: Center(
                    child: Text(
                      '199.00',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
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
                    //     builder: (BuildContext context) => ScreenPayment(),
                    //   ),
                    // );
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Center(
                      child: Text(
                        'Continue',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

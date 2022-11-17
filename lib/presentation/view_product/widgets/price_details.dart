import 'package:flutter/material.dart';

import '../../../core/constants.dart';

class PriceDetails extends StatelessWidget {
  const PriceDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      child: Column(
        children: [
          height_10,
          Row(
            children: [
              width_10,
              Text(
                'Price Details : ',
              ),
            ],
          ),
          height_10,
          height_10,
          Row(
            children: [
              width_10,
              Text(
                'Price (1 item)',
              ),
              Spacer(),
              Text(
                '\$ 199.99',
              ),
              width_10
            ],
          ),
          height_10,
          Row(
            children: [
              width_10,
              Text(
                'Discount',
              ),
              Spacer(),
              Text(
                '-\$ 0.99',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.green,
                ),
              ),
              width_10
            ],
          ),
          height_10,
          Row(
            children: [
              width_10,
              Text(
                'Delivery Charges',
              ),
              Spacer(),
              Text(
                'Free Delivery',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.green,
                ),
              ),
              width_10
            ],
          ),
          height_10,
          Divider(
            color: Colors.white38,
          ),
          height_10,
          Row(
            children: [
              width_10,
              Text(
                'Total Amount',
              ),
              Spacer(),
              Text(
                '\$ 199.00',
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.w900),
              ),
              width_10
            ],
          ),
        ],
      ),
    );
  }
}

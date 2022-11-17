import 'package:flutter/material.dart';

import '../../../core/constants.dart';

class DeliverTo extends StatelessWidget {
  const DeliverTo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      color: Colors.white,
      child: Column(
        children: [
          height_10,
          Row(
            children: [
              width_10,
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text(
                  '  Makima',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Spacer(),
              Container(
                height: 23,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 1, color: Colors.white)),
                child: Text(
                  '  change  ',
                  style: TextStyle(fontSize: 13),
                ),
              ),
              width_10,
            ],
          ),
          Text(
              '\nFlat no H6-902 Arun excello, temple green,\nSripepambur , vallaikotte,\n608768\n\n8976564322')
        ],
      ),
    );
  }
}

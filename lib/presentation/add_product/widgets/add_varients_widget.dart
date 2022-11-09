import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:razer_admin/application/add_product/add_product_bloc.dart';
import 'package:razer_admin/core/constants.dart';

class AddVarientsWidget extends StatelessWidget {
  const AddVarientsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.white70, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              child: GestureDetector(
                onTap: () => BlocProvider.of<AddProductBloc>(context)
                    .add(AddVarients(context: context)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(
                      Icons.add,
                      size: 36,
                      color: Colors.white,
                    ),
                    Text(
                      'Variants',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.9,
              child: BlocBuilder<AddProductBloc, AddProductState>(
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: state.colors.length,
                      itemBuilder: (BuildContext context, int index) =>
                          colorCircle(color: state.colors[index]),
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(
                        height: 5,
                        width: 2,
                      ),
                    ),
                  );
                },
              ),
            ),
            height_20,
          ],
        ),
      ),
    );
  }

  CircleAvatar colorCircle({required String color}) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: 30,
      child: CircleAvatar(
        backgroundColor: Color(int.parse('0xFF$color')),
        // backgroundColor: Color(0x09A8AB),
        radius: 23,
      ),
    );
  }
}

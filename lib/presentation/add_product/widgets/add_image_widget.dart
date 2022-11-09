import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:razer_admin/application/add_product/add_product_bloc.dart';
import 'package:razer_admin/core/constants.dart';
import 'package:razer_admin/functions/image_fuctions/image_fuctions.dart';

class AddImageWidget extends StatelessWidget {
  const AddImageWidget({super.key});

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
                onTap: () {
                  // ImageFunctions.selectImage();
                  BlocProvider.of<AddProductBloc>(context).add(SelectImage());
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(
                      Icons.add,
                      size: 36,
                      color: Colors.white,
                    ),
                    Text(
                      'Images',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: BlocBuilder<AddProductBloc, AddProductState>(
                builder: (context, state) {
                  log('building');
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.images.length,
                      itemBuilder: (BuildContext context, int index) =>
                          imageContainer(context, state.images[index]),
                      separatorBuilder: (BuildContext context, int index) =>
                          height_10,
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

  imageContainer(context, imgUrl) {
    final srcWidth = MediaQuery.of(context).size.width * 0.9;
    return Stack(children: [
      Container(
        width: srcWidth,
        height: srcWidth * 0.7,
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: NetworkImage(imgUrl),
          ),
        ),
      ),
      Positioned(
        bottom: 5,
        right: 5,
        child: GestureDetector(
          onTap: () {
            BlocProvider.of<AddProductBloc>(context)
                .add(UnSelectImage(imgUrl: imgUrl));
            //remove image
          },
          child: const CircleAvatar(
            backgroundColor: Colors.red,
            radius: 20,
            child: Icon(Icons.remove),
          ),
        ),
      )
    ]);
  }
}

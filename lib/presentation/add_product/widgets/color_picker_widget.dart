import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:razer_admin/application/add_product/add_product_bloc.dart';
import 'package:razer_admin/core/constants.dart';

colorBox({required context}) {
  showBottomSheet(
    backgroundColor: Colors.black,
    context: context,
    builder: (context) => Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        height_20,
        const Text(
          'Available Colors',
          style: TextStyle(fontSize: 20),
        ),
        height_10,
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            shrinkWrap: true,
            childAspectRatio: 10 / 11,
            crossAxisCount: 5,
            children: [
              colorCircle(color: '000000', context: context),
              colorCircle(color: 'ffffff', context: context),
              colorCircle(color: 'DBF227', context: context),
              colorCircle(color: 'D6D58E', context: context),
              colorCircle(color: '042940', context: context),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
              elevation: 0,
              textStyle: const TextStyle(fontSize: 20),
              backgroundColor: Colors.green),
          child: const Text('  Cancel  '),
        ),
        height_20,
      ],
    ),
  );
}

BlocBuilder colorCircle({required String color, required context}) {
  return BlocBuilder<AddProductBloc, AddProductState>(
    builder: (context, state) {
      bool isAdded = false;
      if (state.colors.contains(color)) {
        isAdded = true;
      }
      return CircleAvatar(
        backgroundColor: Colors.black,
        radius: 20,
        child: GestureDetector(
          onTap: () {
            // context.read<EditProfileBloc>().add(ColorPicker(color: color));
            BlocProvider.of<AddProductBloc>(context)
                .add(ColorPicker(color: color));
            Navigator.pop(context);
          },
          child: Stack(children: [
            Visibility(
              visible: isAdded,
              child: const Center(
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 35,
                ),
              ),
            ),
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.white,
                // backgroundColor: Color(0x09A8AB),
                radius: 30,
                child: CircleAvatar(
                  backgroundColor: Color(int.parse('0xFF$color')),
                  // backgroundColor: Color(0x09A8AB),
                  radius: 28,
                ),
              ),
            ),
          ]),
        ),
      );
    },
  );
}

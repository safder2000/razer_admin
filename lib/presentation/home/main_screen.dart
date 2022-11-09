import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:razer_admin/presentation/add_product/add_product.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const AddProduct(),
                ),
              );
            },
            icon: Icon(Icons.add))
      ]),
      body: ListView.separated(
        itemBuilder: (context, int) => Container(
          color: Colors.amber,
          height: 50,
          width: double.infinity,
        ),
        itemCount: 5,
        separatorBuilder: (BuildContext context, int index) => Divider(),
      ),
    );
  }
}

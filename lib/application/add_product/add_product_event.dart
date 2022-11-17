part of 'add_product_bloc.dart';

@immutable
abstract class AddProductEvent {}

class AddVarients extends AddProductEvent {
  AddVarients({required this.context});
  final context;
}

class ColorPicker extends AddProductEvent {
  ColorPicker({required this.color});
  final String color;
}

class SelectImage extends AddProductEvent {}

class UnSelectImage extends AddProductEvent {
  UnSelectImage({required this.imgUrl});
  final String imgUrl;
}

class SaveToDB extends AddProductEvent {
  SaveToDB({
    required this.catogory,
    required this.name_controller,
    required this.description_controller,
    required this.spec_controller,
    required this.price_controller,
    required this.quantity_controller,
    required this.rating_controller,
  });
  final String catogory;
  final String name_controller;
  final String description_controller;
  final String spec_controller;
  final String price_controller;
  final String quantity_controller;
  final String rating_controller;
}

class Catogory extends AddProductEvent {
  Catogory({required this.catogory});
  final String catogory;
}

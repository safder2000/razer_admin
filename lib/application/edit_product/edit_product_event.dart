part of 'edit_product_bloc.dart';

@immutable
abstract class EditProductEvent {}

class LoadOldData extends EditProductEvent {
  LoadOldData({required this.product});
  Product product;
}

class AddVarients extends EditProductEvent {
  AddVarients({required this.context});
  final context;
}

class UnSelectImage extends EditProductEvent {
  UnSelectImage({required this.imgUrl});
  final String imgUrl;
}

class ColorPicker extends EditProductEvent {
  ColorPicker({required this.color});
  final String color;
}

class SelectImage extends EditProductEvent {}

class UpdateNewData extends EditProductEvent {
  UpdateNewData({
    required this.context,
    required this.name_controller,
    required this.description_controller,
    required this.spec_controller,
    required this.price_controller,
    required this.quantity_controller,
    required this.rating_controller,
    required this.product,
  });
  final Product product;

  final context;
  final String name_controller;
  final String description_controller;
  final String spec_controller;
  final String price_controller;
  final String quantity_controller;
  final String rating_controller;
}

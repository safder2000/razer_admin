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

class SaveToDB extends AddProductEvent {}

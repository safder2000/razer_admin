part of 'add_product_bloc.dart';

@immutable
class AddProductState {
  String title;
  String description;
  String spec;
  double price;
  double quantity;
  double rating;
  List images;
  List colors;
  String catogory;

  AddProductState({
    required this.title,
    required this.description,
    required this.spec,
    required this.colors,
    required this.price,
    required this.quantity,
    required this.rating,
    required this.images,
    required this.catogory,
  });
}

class InitialState extends AddProductState {
  InitialState()
      : super(
          title: '',
          description: '',
          spec: '',
          price: 0,
          quantity: 0,
          rating: 0,
          images: [],
          colors: [],
          catogory: 'keyboards',
        );
}

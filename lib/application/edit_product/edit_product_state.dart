part of 'edit_product_bloc.dart';

@immutable
class EditProductState {
  EditProductState({
    required this.product,
  });
  Product product;
}

class InitialState extends EditProductState {
  InitialState()
      : super(
          product: Product(
            name: '',
            description: '',
            spec: '',
            price: 0,
            quantity: 0,
            colors: [],
            rating: 0,
            images: [],
            id: '',
          ),
        );
}

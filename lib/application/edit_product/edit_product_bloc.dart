import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:razer_admin/application/add_product/add_product_bloc.dart';
import 'package:razer_admin/functions/image_fuctions/image_fuctions.dart';
import 'package:razer_admin/model/product_model.dart';

import '../../functions/update_product/update_product_fuctions.dart';
import '../../presentation/Edit_product/widgets/color_picker_widget.dart';

part 'edit_product_event.dart';
part 'edit_product_state.dart';

class EditProductBloc extends Bloc<EditProductEvent, EditProductState> {
  EditProductBloc() : super(InitialState()) {
    on<EditProductEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<LoadOldData>((event, emit) {
      emit(EditProductState(
        product: Product(
            name: event.product.name,
            description: event.product.description,
            spec: event.product.spec,
            colors: event.product.colors,
            price: event.product.price,
            quantity: event.product.quantity,
            rating: event.product.rating,
            images: event.product.images,
            id: state.product.id,
            category: state.product.category),
      ));
    });
    on<AddVarients>((event, emit) {
      colorBox(context: event.context);
    });
    on<ColorPicker>((event, emit) {
      List _colors = state.product.colors;
      if (_colors.contains(event.color)) {
        log('color removing');
        _colors.remove(event.color);
      } else {
        _colors.add(event.color);
        log('color added');
      }
      emit(EditProductState(
          product: Product(
        name: state.product.name,
        description: state.product.description,
        spec: state.product.spec,
        colors: _colors,
        price: state.product.price,
        quantity: state.product.quantity,
        rating: state.product.rating,
        images: state.product.images,
        id: state.product.id,
        category: state.product.category,
      )));
    });
    on<SelectImage>((event, emit) async {
      final imageUrl = await ImageFunctions.getImage();
      // if (imageUrl != null) {}
      log("${imageUrl}");
      List _newImgList =
          ImageFunctions.addImage(state.product.images, imageUrl!);
      emit(
        EditProductState(
          product: Product(
            colors: state.product.colors,
            images: _newImgList,
            name: state.product.name,
            description: state.product.description,
            spec: state.product.spec,
            quantity: state.product.quantity,
            rating: state.product.rating,
            price: state.product.price,
            id: state.product.id,
            category: state.product.category,
          ),
        ),
      );
      on<UnSelectImage>((event, emit) {
        List newList = state.product.images;
        newList.remove(event.imgUrl);
        log('img removed from state');
        emit(EditProductState(
          product: Product(
              name: state.product.name,
              description: state.product.description,
              spec: state.product.spec,
              colors: state.product.colors,
              price: state.product.price,
              quantity: state.product.quantity,
              rating: state.product.rating,
              images: newList,
              id: state.product.id,
              category: state.product.category),
        ));
      });
      on<UpdateNewData>((event, emit) {
        log('Update event called');

        UpdateProductFunctions.updateProduct(
          name: event.name_controller,
          description: event.description_controller,
          spec: event.spec_controller,
          price: event.price_controller,
          quantity: event.quantity_controller,
          rating: event.rating_controller,
          colors: state.product.colors,
          images: state.product.images,
          context: event.context,
          product: event.product,
        );
        emit(EditProductState(
          product: Product(
              name: state.product.name,
              description: state.product.description,
              spec: state.product.spec,
              colors: state.product.colors,
              price: state.product.price,
              quantity: state.product.quantity,
              rating: state.product.rating,
              images: state.product.images,
              id: state.product.id,
              category: state.product.category),
        ));
      });
    });
  }
}

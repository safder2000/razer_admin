import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:razer_admin/functions/image_fuctions/image_fuctions.dart';
import 'package:razer_admin/presentation/add_product/widgets/color_picker_widget.dart';

part 'add_product_event.dart';
part 'add_product_state.dart';

class AddProductBloc extends Bloc<AddProductEvent, AddProductState> {
  AddProductBloc() : super(InitialState()) {
    on<AddProductEvent>((event, emit) {});
    on<AddVarients>((event, emit) {
      colorBox(context: event.context);
    });
    on<ColorPicker>((event, emit) {
      List _colors = state.colors;
      if (_colors.contains(event.color)) {
        log('color removing');
        _colors.remove(event.color);
      } else {
        _colors.add(event.color);
        log('color added');
      }
      emit(AddProductState(
          title: state.title,
          description: state.description,
          spec: state.spec,
          colors: _colors,
          price: state.price,
          quantity: state.quantity,
          rating: state.rating,
          images: state.images));
    });
    on<SelectImage>((event, emit) async {
      final imageUrl = await ImageFunctions.getImage();
      // if (imageUrl != null) {}
      log("${imageUrl}");
      List newImgList = ImageFunctions.addImage(state.images, imageUrl!);
      emit(AddProductState(
          title: state.title,
          description: state.description,
          spec: state.spec,
          colors: state.colors,
          price: state.price,
          quantity: state.quantity,
          rating: state.rating,
          images: newImgList));
    });
    on<UnSelectImage>((event, emit) {
      List newList = state.images;
      newList.remove(event.imgUrl);
      log('img removed from state');
      emit(AddProductState(
          title: state.title,
          description: state.description,
          spec: state.spec,
          colors: state.colors,
          price: state.price,
          quantity: state.quantity,
          rating: state.rating,
          images: newList));
    });
  }
}

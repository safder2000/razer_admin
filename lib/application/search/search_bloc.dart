import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:razer_admin/functions/search_functions/search_function.dart';
import 'package:razer_admin/model/product_model.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(InitialState()) {
    on<SearchEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<SearchSong>((event, emit) async {
      List<Product> _temp =
          await SearchFuction.searchProduct(Search_text: event.search_text);
      emit(SearchState(productList: _temp));
    });
  }
}

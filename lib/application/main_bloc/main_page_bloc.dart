import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'main_page_event.dart';
part 'main_page_state.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  MainPageBloc() : super(InitialState()) {
    on<MainPageEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<DisplayCategory>((event, emit) {
      emit(MainPageState(category: event.category));
    });
  }
}

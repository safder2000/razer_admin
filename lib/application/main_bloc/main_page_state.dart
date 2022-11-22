part of 'main_page_bloc.dart';

@immutable
class MainPageState {
  MainPageState({required this.category});
  String category;
}

class InitialState extends MainPageState {
  InitialState()
      : super(
          category: 'all',
        );
}

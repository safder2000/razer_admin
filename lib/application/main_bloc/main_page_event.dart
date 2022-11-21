part of 'main_page_bloc.dart';

@immutable
class MainPageEvent {}

class DisplayCategory extends MainPageEvent {
  DisplayCategory({required this.category});
  final String category;
}

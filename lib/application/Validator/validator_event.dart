part of 'validator_bloc.dart';

@immutable
abstract class ValidatorEvent {}

class CheckValidity extends ValidatorEvent {
  CheckValidity({required this.string});
  String string;
}

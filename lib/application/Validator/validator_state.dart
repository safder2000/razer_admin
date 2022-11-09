part of 'validator_bloc.dart';

@immutable
abstract class ValidatorState {
  bool isNameValid;
  // bool isDicrValid;
  // bool isSpecValid;
  // bool isValid;
  // bool isNameValid;
  ValidatorState({
    required this.isNameValid,
  });
}

class InitialState extends ValidatorState {
  InitialState() : super(isNameValid: true);
}

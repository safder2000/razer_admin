import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'validator_event.dart';
part 'validator_state.dart';

class ValidatorBloc extends Bloc<ValidatorEvent, ValidatorState> {
  ValidatorBloc() : super(InitialState()) {
    on<ValidatorEvent>((event, emit) {
      // TODO: implement event handler
    });
    // on<CheckValidity>((event, emit) {
    //   bool isNotValid;
    //   if (event.string.isEmpty) {
    //     isNotValid = true;
    //   } else {
    //     isNotValid = false;
    //   }
    // });
  }
}

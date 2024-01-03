import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/screen/signin/sign_in_event.dart';
import 'package:flutterbloc/screen/signin/sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc()
      : super(
          SignInInitialState(),
        ) {
    on<SignInTextChangedEvent>((event, emit) {
      if (event.emailValue == "") {
        emit(
          SignInErrorState(
            errorMessage: 'Please enter a valid email address',
          ),
        );
      }
    });
    on<SignInSubmittedEvent>((event, emit) => null);
  }
}

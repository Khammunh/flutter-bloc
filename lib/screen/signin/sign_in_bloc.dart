import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/screen/signin/sign_in_event.dart';
import 'package:flutterbloc/screen/signin/sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc()
      : super(
          SignInInitialState(),
        ) {
    on<SignInTextChangedEvent>(
      (event, emit) {
        if (EmailValidator.validate(event.emailValue) == false) {
          emit(
            SignInErrorState(
              errorMessage: 'Please enter a valid email address',
            ),
          );
        } else if (event.passwordValue.length < 8) {
          emit(
            SignInErrorState(errorMessage: 'Please enter a validator password'),
          );
        } else {
          emit(
            SignInInValidState(),
          );
        }
      },
    );
    on<SignInSubmittedEvent>((event, emit) {
      emit(
        SignInLoadingState(),
      );
    });
  }
}

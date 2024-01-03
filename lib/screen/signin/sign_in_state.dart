abstract class SignInState {}

class SignInInitialState extends SignInState {}

class SignInInvalidState extends SignInState {}

class SignInValidState extends SignInState {}

class SignInErrorState extends SignInState {
  final String errorMessage;
  SignInErrorState({
    required this.errorMessage,
  });
}

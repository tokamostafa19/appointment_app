abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {
  final String message;
  final String token;
  final String username;

  SignupSuccess({
    required this.message,
    required this.token,
    required this.username,
  });
}

class SignupError extends SignupState {
  final String error;

  SignupError({
    required this.error,
  });
}
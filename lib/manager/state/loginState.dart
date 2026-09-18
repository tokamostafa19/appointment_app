abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String message;
  final String token;
  final String username;

  LoginSuccess({
    required this.message,
    required this.token,
    required this.username,
  });
}

class LoginError extends LoginState {
  final String error;

  LoginError({
    required this.error,
  });
}
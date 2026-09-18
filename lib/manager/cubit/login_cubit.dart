import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/logindata.dart';
import '../state/loginState.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;

  LoginCubit(this.loginRepo) : super(LoginInitial());

  TextEditingController emailController =
  TextEditingController();

  TextEditingController passwordController =
  TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool isPasswordObscure = true;

  void togglePassword() {
    isPasswordObscure = !isPasswordObscure;

    emit(LoginInitial());
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    if (!value.contains('@')) {
      return 'Enter a valid email';
    }

    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }

    return null;
  }

  void emitLoginStates() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    emit(LoginLoading());

    try {
      final response = await loginRepo.login(
        email: emailController.text,
        password: passwordController.text,
      );

      final token = response['token'];
      final username = response['username'];

      print('Token: $token');
      print('Username: $username');

      emit(
        LoginSuccess(
          message: 'Login successfully',
          token: token,
          username: username,
        ),
      );
    } catch (e) {
      emit(
        LoginError(
          error: e.toString(),
        ),
      );
    }
  }
}
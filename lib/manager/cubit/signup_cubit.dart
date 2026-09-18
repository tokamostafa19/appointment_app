import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/signupdata.dart';
import '../state/signupState.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo signupRepo;

  SignupCubit(this.signupRepo) : super(SignupInitial());

  TextEditingController nameController =
  TextEditingController();

  TextEditingController emailController =
  TextEditingController();

  TextEditingController phoneController =
  TextEditingController();

  TextEditingController passwordController =
  TextEditingController();

  TextEditingController passwordConfirmationController =
  TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool isPasswordObscure = true;
  bool isConfirmationObscure = true;

  int gender = 0;

  void togglePassword() {
    isPasswordObscure = !isPasswordObscure;
    emit(SignupInitial());
  }

  void toggleConfirmationPassword() {
    isConfirmationObscure = !isConfirmationObscure;
    emit(SignupInitial());
  }

  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }

    return null;
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

  String? phoneValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone is required';
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

  String? confirmationValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }

    if (value != passwordController.text) {
      return 'Passwords do not match';
    }

    return null;
  }

  void emitSignupStates() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    emit(SignupLoading());

    try {
      final response = await signupRepo.signup(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        gender: gender,
        password: passwordController.text,
        passwordConfirmation:
        passwordConfirmationController.text,
      );

      final token = response['token'];
      final username = response['username'];

      print('Token: $token');
      print('Username: $username');

      emit(
        SignupSuccess(
          message: 'Account created successfully',
          token: token,
          username: username,
        ),
      );
    } catch (e) {
      emit(
        SignupError(
          error: e.toString(),
        ),
      );
    }
  }
}
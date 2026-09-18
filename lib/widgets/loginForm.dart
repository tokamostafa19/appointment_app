import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/cubit/login_cubit.dart';
import '../widgets/textfield.dart';
import '../widgets/button.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();

    return Form(
      key: cubit.formKey,
      child: Column(
        children: [

          CustomTextField(
            hintText: 'Email',
            controller: cubit.emailController,
            validator: cubit.emailValidator,
          ),

          SizedBox(height: 15),

          CustomTextField(
            hintText: 'Password',
            controller: cubit.passwordController,
            obscureText: cubit.isPasswordObscure,
            validator: cubit.passwordValidator,
          ),

          SizedBox(height: 15),

          BlueButton(
            text: 'Login',
            onPressed: () {
              cubit.emitLoginStates();
            },
          ),
        ],
      ),
    );
  }
}
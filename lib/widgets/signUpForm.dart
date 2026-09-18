import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/cubit/signup_cubit.dart';
import '../widgets/textfield.dart';
import '../widgets/button.dart';

class SignupForm extends StatelessWidget {
  SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignupCubit>();

    return Form(
      key: cubit.formKey,

      child: Column(
        children: [

          CustomTextField(
            hintText: 'Name',
            controller: cubit.nameController,
            validator: cubit.nameValidator,
          ),

          SizedBox(height: 15),

          CustomTextField(
            hintText: 'Email',
            controller: cubit.emailController,
            validator: cubit.emailValidator,
          ),

          SizedBox(height: 15),

          CustomTextField(
            hintText: 'Phone',
            controller: cubit.phoneController,
            validator: cubit.phoneValidator,
          ),

          SizedBox(height: 15),

          DropdownButtonFormField<int>(
            value: cubit.gender,
            decoration: InputDecoration(
              hintText: 'Gender',
              filled: true,
              fillColor: Color(0xffFAFAFA),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            items: [
              DropdownMenuItem(
                value: 0,
                child: Text('Male'),
              ),
              DropdownMenuItem(
                value: 1,
                child: Text('Female'),
              ),
            ],
            onChanged: (value) {
              if (value != null) {
                cubit.gender = value;
              }
            },
          ),

          SizedBox(height: 15),

          CustomTextField(
            hintText: 'Password',
            controller: cubit.passwordController,
            obscureText: cubit.isPasswordObscure,
            validator: cubit.passwordValidator,
          ),

          SizedBox(height: 15),

          CustomTextField(
            hintText: 'Confirm Password',
            controller:
            cubit.passwordConfirmationController,
            obscureText: cubit.isConfirmationObscure,
            validator: cubit.confirmationValidator,
          ),

          SizedBox(height: 20),

          BlueButton(
            text: 'Sign Up',
            onPressed: () {
              cubit.emitSignupStates();
            },
          ),
        ],
      ),
    );
  }
}
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/signupdata.dart';
import '../manager/colormanager.dart';
import '../manager/cubit/signup_cubit.dart';
import '../manager/state/signupState.dart';
import '../widgets/signupForm.dart';
import '../widgets/socialButtons.dart';
import 'homePage.dart';


class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(
        SignupRepo(
          Dio(),
        ),
      ),
      child: SignUpView(),
    );
  }
}

class SignUpView extends StatelessWidget {
  SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {

        if (state is SignupSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(
                username: state.username,
              ),
            ),
          );
        }

        if (state is SignupError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
            ),
          );
        }
      },

      child: Scaffold(
        backgroundColor: Colors.white,

        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),

            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  SizedBox(height: 25),

                  Text(
                    'Create Account',
                    style: TextStyle(
                      color: ColorManager.Bluecolor,
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    'Create your account and feel the benefits.',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),

                  SizedBox(height: 30),

                  SignupForm(),

                  SizedBox(height: 25),

                  SocialButtons(),

                  SizedBox(height: 25),

                  Center(
                    child: Text(
                      'By signing up, you agree to our Terms & Conditions and\n'
                          'Privacy Policy.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 9,
                      ),
                    ),
                  ),

                  SizedBox(height: 25),

                  Center(
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      children: [

                        Text(
                          'Already have an account? ',
                          style: TextStyle(
                            fontSize: 11,
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              color: ColorManager.Bluecolor,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/logindata.dart';
import '../manager/colormanager.dart';
import '../manager/cubit/login_cubit.dart';
import '../manager/state/loginState.dart';
import '../widgets/loginForm.dart';
import '../widgets/socialButtons.dart';

import 'homePage.dart';
import 'registerScreen.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(
        LoginRepo(
          Dio(),
        ),
      ),
      child: SignInView(),
    );
  }
}

class SignInView extends StatelessWidget {
  SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {

        if (state is LoginSuccess) {
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

        if (state is LoginError) {
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
                    'Welcome Back',
                    style: TextStyle(
                      color: ColorManager.Bluecolor,
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    "We're excited to have you back, can't wait to\n"
                        "see what you have been up to since you last\n"
                        "logged in.",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      height: 1.7,
                    ),
                  ),

                  SizedBox(height: 30),

                  LoginForm(),

                  SizedBox(height: 15),

                  Row(
                    children: [

                      Checkbox(
                        value: false,
                        onChanged: (value) {},
                      ),

                      Text(
                        'Remember me',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 11,
                        ),
                      ),

                      Spacer(),

                      Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: ColorManager.Bluecolor,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  SocialButtons(),

                  SizedBox(height: 35),

                  Center(
                    child: Text(
                      'By logging, you agree to our Terms & Conditions and\n'
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
                          "Don't have an account? ",
                          style: TextStyle(
                            fontSize: 11,
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    SignUpScreen(),
                              ),
                            );
                          },

                          child: Text(
                            'Sign Up',
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
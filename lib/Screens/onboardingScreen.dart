import 'package:appointment_app/manager/colormanager.dart';
import 'package:flutter/material.dart';

import '../widgets/button.dart';
import 'loginScreen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
               SizedBox(height: 40),

              // Logo
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.local_hospital_outlined,
                    color: ColorManager.Bluecolor,
                    size: 30,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Docdoc',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),

              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/Group.png',
                      fit: BoxFit.contain,
                    ),
                    Center(
                      child: Image.asset(
                        'assets/b2cf887034666860d0d8047b7ed3d9a1d63fc41f.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),

                 Text(
                    'Best Doctor\nAppointment App',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorManager.Bluecolor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

              SizedBox(height: 15),

              const Text(
                'Manage and schedule all of your medical appointments easily\n'
                    'with Docdoc to get a new experience.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 11),
              ),

              const SizedBox(height: 25),

              BlueButton(
                text: 'Get Started',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignInScreen()),
                  );
                },
              ),

               SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
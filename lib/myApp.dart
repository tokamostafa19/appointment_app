import 'package:appointment_app/Screens/onboardingScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    ) ;
  }
}

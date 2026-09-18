import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(
              child: Divider(color: Colors.grey),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Or sign in with',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 11,
                ),
              ),
            ),

            const Expanded(
              child: Divider(color: Colors.grey),
            ),
          ],
        ),

         SizedBox(height: 25),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              FontAwesomeIcons.google,
              size: 20,
            ),
             SizedBox(width: 25),
            FaIcon(
              FontAwesomeIcons.facebookF,
              size: 20,
            ),
             SizedBox(width: 25),
            FaIcon(
              FontAwesomeIcons.apple,
              size: 20,
            )
          ],
        ),
      ],
    );
  }

  Widget _socialButton(String text) {
    return Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(
        color: const Color(0xffF8F8F8),
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
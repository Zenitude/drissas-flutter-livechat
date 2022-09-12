library link_component;

import 'package:flutter/material.dart';
import 'package:my_app/pages/signup/signup_page.dart';

class LinksSignIn extends StatelessWidget {
  const LinksSignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Pas de compte ?', 
          style: TextStyle(
            color: Colors.white
          ),
        ),
        TextButton(
          child: const Text(
            'Inscrivez-vous',
            style: TextStyle(
              color: Colors.white,
              decoration: TextDecoration.underline
            ),
          ),
          onPressed: () {
            Navigator.push(context,
            MaterialPageRoute(builder: ((context) => const SignUpPage())));
          }
        ),
      ],
    );
  }
}

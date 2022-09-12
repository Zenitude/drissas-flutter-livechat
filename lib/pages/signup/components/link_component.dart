library link_component;

import 'package:flutter/material.dart';
import 'package:my_app/pages/signin/signin_page.dart';

class LinkSignInPage extends StatelessWidget {
  const LinkSignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: const Text(
        'Déjà un compte ?',
        style: TextStyle(
          color: Colors.white,
          decoration: TextDecoration.underline
        ),
      ),
      onPressed: () {
        Navigator.push(context,
        MaterialPageRoute(builder: ((context) => const SignInPage())));
      }
    );
  }
}

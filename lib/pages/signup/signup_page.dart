library signup_page;

import 'package:flutter/material.dart';

import 'package:my_app/pages/signup/components/title_component.dart';
import 'package:my_app/pages/signup/components/form_component.dart';
import 'package:my_app/pages/signup/components/link_component.dart';
import 'package:my_app/widgets/appbar_widget.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'Flutter Live Chat'),
      body: Container(
        padding: const EdgeInsets.only(top: 20),
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Colors.blue,
              Color.fromARGB(255, 69, 228, 186),
              Colors.green
            ])),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const 
              [
                TitleSection(),
                FormSection(),
                LinkSignInPage(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

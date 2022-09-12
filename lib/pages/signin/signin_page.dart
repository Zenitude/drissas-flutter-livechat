library signin_page;

import 'package:flutter/material.dart';
//import 'package:my_app/pages/signin/components/icon_component.dart';
import 'package:my_app/pages/signin/components/titles_component.dart';
import 'package:my_app/pages/signin/components/form_component.dart';
import 'package:my_app/pages/signin/components/links_component.dart';
import 'package:my_app/widgets/appbar_widget.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'Flutter Live Chat'),
      body: Container(
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            //IconChat(linkIcon: 'images/iconChat.png'),
            TitleSection(
                first: 'Firebase',
                second: 'Chat',
                text: 'Connectez-vous avec vos identifiants'),
            FormSection(),
            LinksSignIn(),
          ],
        ),
      ),
    );
  }
}

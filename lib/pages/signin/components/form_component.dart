// ignore_for_file: avoid_print

library form_component;

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_app/pages/signin/components/sub_components/inputform_component.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class FormSection extends StatelessWidget
{
  const FormSection({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context)
  {
  TextEditingController passwordController = TextEditingController();
  TextEditingController mailController = TextEditingController();
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Form(
        child: Column(
          children: 
          [
            InputForm(iconName: Icons.mail, nameField: 'Adresse email', nameController: mailController, obscure: false),
            InputForm(iconName: Icons.password, nameField: 'Mot de passe', nameController: passwordController, obscure: true),
            ElevatedButton(
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
      child: Container(
        width: 280,
        height: 40,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: const Center(
          child: Text(
            'CONNEXION',
            style: TextStyle(color: Colors.blue, fontSize: 18),
          ),
        ),
      ),
      onPressed: () {
        auth
          .signInWithEmailAndPassword(
            email: mailController.text.trim(), 
            password: passwordController.text.trim()
          ) 
          .then((value) {
            print('user Connected : ${value.user!.email}');
          }).catchError((e) {
            print(e.error);
          });
      },
    )
          ]
        ),
      ),
    );
  }
}
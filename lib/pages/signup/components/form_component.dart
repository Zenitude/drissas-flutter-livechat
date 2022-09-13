// ignore_for_file: avoid_print

library form_component;

import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:my_app/pages/signup/components/sub_components/inputform_component.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;
FirebaseStorage storage = FirebaseStorage.instance;

class FormSection extends StatefulWidget {
  const FormSection({Key? key}) : super(key: key);

  @override
  State<FormSection> createState() => _FormSectionState();
}

class _FormSectionState extends State<FormSection> {
  File? _image;
  final picker = ImagePicker();

  TextEditingController pseudoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mailController = TextEditingController();

  Future getImageGallery() async {
    XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected');
      }
    });
  }

  signUp(pseudo, mail, password, image) {
    try {
      auth
          .createUserWithEmailAndPassword(
              email: mail.text.trim(), password: password.text.trim())
          .then((value) {
        try {
          registerUserToFirestore(value, pseudo);
        } catch (e) {
          print('Error Create User Firestore : $e');
        }

        try {
          auth
              .signInWithEmailAndPassword(
                  email: mail.text.trim(), password: password.text.trim())
              .then((value) async {
            registerImageToStorage(value, image);
          }).catchError((e) {
            print('Error SignIn Auth : ${e.error}');
          });
        } catch (e) {
          print('Erreur Auth SignIn : $e');
        }
      }).catchError((e) {
        print('Error Create User Auth : ${e.error}');
      });
    } catch (e) {
      print('Erreur Global SignUp : $e');
    }
  }

  registerUserToFirestore(value, pseudo) {
    try {
      firestore.collection('users').doc(value.user!.uid).set({
        "pseudo": pseudo.text.trim(),
      }).catchError((e) {
        print(e.error);
      });
    } catch (e) {
      print('Erreur Firestore Create User : $e');
    }
  }

  registerImageToStorage(value, image) async {
    try {
      Reference storageRef = storage
          .ref('users')
          .child(value.user!.uid)
          .child('profil')
          .child('avatar.png');

      UploadTask uploadTask = storageRef.putFile(image!);

      await uploadTask.whenComplete(() => print('File Uploaded'));
    } catch (e) {
      print('Erreur Storage Create User : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Form(
        child: Column(
          children: [
            InputForm(
                iconName: Icons.people,
                nameField: 'Pseudo',
                nameController: pseudoController,
                obscure: false),
            InputForm(
                iconName: Icons.mail,
                nameField: 'Adresse email',
                nameController: mailController,
                obscure: false),
            InputForm(
                iconName: Icons.password,
                nameField: 'Mot de passe',
                nameController: passwordController,
                obscure: true),
            _image == null
                ? Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    width: 282,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.white,
                            width: 1,
                            style: BorderStyle.solid),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30))),
                    child: Row(
                      children: [
                        Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            child: const Icon(
                              Icons.image,
                              color: Colors.blue,
                            )),
                        SizedBox(
                          width: 240,
                          height: 40,
                          child: TextButton(
                              onPressed: () {
                                getImageGallery();
                              },
                              child: const Text(
                                'Photo de profil',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                      ],
                    ),
                  )
                : Container(
                    width: 140,
                    height: 140,
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(200)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(0, 0)),
                      ],
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(200),
                        child: Image.file(_image!, fit: BoxFit.cover))),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
              child: Container(
                width: 280,
                height: 40,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: const Center(
                  child: Text(
                    'INSCRIPTION',
                    style: TextStyle(color: Colors.blue, fontSize: 18),
                  ),
                ),
              ),
              onPressed: () {
                signUp(pseudoController, mailController, passwordController,
                    _image);
              },
            ),
          ],
        ),
      ),
    );
  }
}

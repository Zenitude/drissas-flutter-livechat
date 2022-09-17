// ignore_for_file: avoid_print, invalid_return_type_for_catch_error

library appbar_profil_widget;

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:my_app/pages/profil/profil_page.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore store = FirebaseFirestore.instance;
FirebaseStorage storage = FirebaseStorage.instance;

class MyAppBarProfil extends StatefulWidget implements PreferredSizeWidget {
  const MyAppBarProfil({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  State<MyAppBarProfil> createState() {
    return _MyAppBarProfilState();
  }
}

class _MyAppBarProfilState extends State<MyAppBarProfil> {

  refreshPage(context) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const ProfilPage(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Profil', style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.amber,
      actions: [
        IconButton(
            onPressed: () {
              refreshPage(context);
            },
            icon: const Icon(Icons.refresh)),
        IconButton(
            onPressed: () {
              auth.signOut();
            },
            icon: const Icon(Icons.stop_screen_share))
      ],
    );
  }
}

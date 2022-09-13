// ignore_for_file: avoid_print, invalid_return_type_for_catch_error

library appbar_connected_widget;

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:my_app/pages/profil/profil_page.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore store = FirebaseFirestore.instance;
FirebaseStorage storage = FirebaseStorage.instance;

class MyAppBarContacts extends StatefulWidget implements PreferredSizeWidget {
  const MyAppBarContacts({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  State<MyAppBarContacts> createState() {
    return _MyAppBarContactsState();
  }
}

class _MyAppBarContactsState extends State<MyAppBarContacts> {
  String idUser = auth.currentUser!.uid;
  String? urlImgUser;

  @override
  initState() {
    super.initState();
    getUrlImgUser();
  }

  getUrlImgUser() {
    Reference storageRef =
        storage.ref('users').child(idUser).child('profil').child('avatar.png');

    storageRef.getDownloadURL().then((downloadUrl) {
      setState(() {
        urlImgUser = downloadUrl.toString();
      });
    }).catchError((e) => print(e.error));
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: FutureBuilder<DocumentSnapshot>(
          future: store.collection('users').doc(idUser).get(),
          builder: ((context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              print('Error database');
            }

            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;
              return TextButton(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.amber,
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.all(1),
                      width: 50,
                      height: 50,
                      child: urlImgUser == null
                          ? const Icon(Icons.person, color: Colors.white,)
                          : CircleAvatar(
                              backgroundImage: NetworkImage(urlImgUser!),
                            ),
                    ),
                    Text(
                      data['pseudo'],
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfilPage()));
                },
              );
            }

            return const Text('Erreur Pseudo');
          })),
      backgroundColor: Colors.amber,
      actions: 
      [
        IconButton(onPressed: () {}, icon: const Icon(Icons.refresh)),
        IconButton(
            onPressed: () {
              auth.signOut();
            },
            icon: const Icon(Icons.stop_screen_share))
      ],
    );
  }
}
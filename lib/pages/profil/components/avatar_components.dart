// ignore_for_file: avoid_print

library avatar_component;

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;
FirebaseStorage storage = FirebaseStorage.instance;

class AvatarProfil extends StatefulWidget {
  const AvatarProfil({super.key});

  @override
  State<AvatarProfil> createState() {
    return _AvatarProfilState();
  }
}

class _AvatarProfilState extends State<AvatarProfil> {
  String? urlImgUser;

  @override
  initState() {
    super.initState();
    getUrlImgUser();
  }

  getUrlImgUser() {
    Reference storageRef = storage
        .ref('users')
        .child(auth.currentUser!.uid)
        .child('profil')
        .child('avatar.png');

    storageRef.getDownloadURL().then((downloadUrl) {
      setState(() {
        urlImgUser = downloadUrl.toString();
      });
    }).catchError((e) {
      print(e.error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      color: Colors.amberAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Center(
            child: Container(
              padding: const EdgeInsets.all(5),
              width: 150,
              height: 150,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 0)),
                  ]),
              child: urlImgUser != null
              ? ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                  child: Image.network(
                    urlImgUser!,
                    fit: BoxFit.cover,
                  ))
              : const Text('No image profil'),
            ),
          ),

          FutureBuilder(
            future: firestore.collection('users').doc(auth.currentUser!.uid).get(),
            builder: ((context, AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasError) {
                print('Error database');
              }

              if (snapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic> data =
                    snapshot.data!.data() as Map<String, dynamic>;

                return Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Text(
                    data['pseudo'],
                    style: const TextStyle(
                      color: Colors.white, 
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    )
                  ),
                );
              }

              return const Text('Erreur Pseudo');
            }),
          ),

        ],
      ),
    );
  }
}

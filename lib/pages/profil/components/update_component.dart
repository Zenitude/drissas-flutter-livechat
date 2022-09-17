library update_component;

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseStorage storage = FirebaseStorage.instance;

class UpdateAvatar extends StatefulWidget {
  const UpdateAvatar({super.key});

  @override
  State<UpdateAvatar> createState() {
    return _UpdateAvatarState();
  }
}

class _UpdateAvatarState extends State<UpdateAvatar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(0),
            ),
            onPressed: (() {}),
            child: Container(
                width: 240,
                height: 40,
                decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: const Center(
                  child: Text('Modifier ma photo',
                      style: TextStyle(color: Colors.white)),
                )),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(0),
            ),
            onPressed: (() {}),
            child: Container(
                width: 240,
                height: 40,
                decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black,
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 0))
                    ],
                    color: Colors.amber,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: const Center(
                  child: Text('Envoyer cette photo',
                      style: TextStyle(color: Colors.white)),
                )),
          )
        ],
      ),
    );
  }
}

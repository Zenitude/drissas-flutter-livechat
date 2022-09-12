library button_disconnect;

import 'package:flutter/material.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class ButtonDisconnect extends StatelessWidget {
  const ButtonDisconnect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: (() {
          //FirebaseAuth.instance.signOut();
          debugPrint('user disconnect');
        }),
        child: const Text('deconnexion'));
  }
}

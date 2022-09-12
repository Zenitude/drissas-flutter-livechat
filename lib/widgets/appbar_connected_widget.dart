library appbar_connected_widget;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_app/pages/profil/profil_page.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class MyAppBarConnected extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBarConnected({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Container(
        margin: const EdgeInsets.fromLTRB(8, 8, 0, 0),
        child: TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProfilPage()));
            },
            child: const Text('Hello contacts')
            /*Row(
              children: const [
                SizedBox(
                  width: 40,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('images/iconChat.png'),
                  ),
                ),
                Text('Lastname Firstname'),
              ],
            )*/
            ),
      ),
      backgroundColor: Colors.blue,
      actions: [
        IconButton(
            onPressed: () {
              auth.signOut();
            },
            icon: const Icon(Icons.leak_remove))
      ],
    );
  }
}

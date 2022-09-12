library appbar_widget;

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue,
      title: Text(title),
      centerTitle: true,
      actions: [
        auth.currentUser != null
        ? IconButton(
            onPressed: () {
              auth.signOut();
            },
            icon: const Icon(Icons.leak_remove))
        : const Text(''),
      ],
    );
  }
}

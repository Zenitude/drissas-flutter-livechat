// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:my_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:my_app/pages/myapp/myapp_page.dart';
import 'package:my_app/pages/myapp/myapplogged_page.dart';

FirebaseAuth auth = FirebaseAuth.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  auth.authStateChanges().listen((User? user) {
    if (user == null) {
      print('User not connected');
        runApp(const MyApp());
    } else {
      print('User connected : ${user.uid}, ${user.email}');
      runApp(const MyAppLogged());
    }
  });

}

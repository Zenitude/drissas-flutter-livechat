library myapplogged_page;

import 'package:flutter/material.dart';
import 'package:my_app/pages/contacts/contacts_page.dart';

class MyAppLogged extends StatefulWidget {
  const MyAppLogged({Key? key}) : super(key: key);

  @override
  State<MyAppLogged> createState() {
    return _MyAppLoggedState();
  }
}

class _MyAppLoggedState extends State<MyAppLogged> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Live Chat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ContactsPage(),
    );
  }
}

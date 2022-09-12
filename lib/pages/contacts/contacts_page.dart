library contacts_page;

import 'package:flutter/material.dart';
import 'package:my_app/widgets/appbar_connected_widget.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  State<ContactsPage> createState() {
    return _ContactsPageState();
  }
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBarConnected(),
      body: Center(
        child: Text('Hello Contacts'),
      ),
    );
  }
}

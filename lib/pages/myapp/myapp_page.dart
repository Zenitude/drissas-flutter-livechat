library myapp_page;

import 'package:flutter/material.dart';
import 'package:my_app/pages/signin/signin_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Live Chat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SignInPage()
    );
  }
}

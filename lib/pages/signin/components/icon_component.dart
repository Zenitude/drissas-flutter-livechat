library icon_component;

import 'package:flutter/material.dart';

class IconChat extends StatelessWidget {
  const IconChat({Key? key, required this.linkIcon}) : super(key: key);

  final String linkIcon;
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        width: 150,
        height: 150,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                  color: Colors.lightBlueAccent,
                  spreadRadius: 5,
                  blurRadius: 15,
                  offset: Offset(0, 0))
            ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image(width: 140, height: 140, image: AssetImage(linkIcon)),
        ),
      ),
    );
  }
}
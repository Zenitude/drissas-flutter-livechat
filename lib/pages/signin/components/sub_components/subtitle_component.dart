library subtitle_component;

import 'package:flutter/material.dart';

class SubTitle extends StatelessWidget {
  const SubTitle({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 14
      ),
    );
  }
}

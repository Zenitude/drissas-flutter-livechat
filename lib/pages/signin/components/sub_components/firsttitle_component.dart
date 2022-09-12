library firsttitle_component;

import 'package:flutter/material.dart';

class FirstTitle extends StatelessWidget {
  const FirstTitle({Key? key, required this.first, required this.second})
      : super(key: key);

  final String first, second;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          first,
          style: const TextStyle(
            color: Colors.white, 
            fontSize: 40,
            fontWeight: FontWeight.bold
          ),
        ),
        Text(
          second,
          style: const TextStyle(
            color: Colors.green, 
            fontSize: 40,
            fontWeight: FontWeight.bold
          ),
        ),
      ],
    );
  }
}

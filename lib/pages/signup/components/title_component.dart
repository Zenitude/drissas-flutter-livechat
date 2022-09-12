library title_component;

import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Créez-vous un compte',
      style: TextStyle(
        color: Colors.white
      ),
    );
  }
}

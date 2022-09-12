library titles_component;

import 'package:flutter/material.dart';
import 'package:my_app/pages/signin/components/sub_components/firsttitle_component.dart';
import 'package:my_app/pages/signin/components/sub_components/subtitle_component.dart';

class TitleSection extends StatelessWidget {
  const TitleSection(
      {Key? key, required this.first, required this.second, required this.text})
      : super(key: key);

  final String first, second, text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: 
      [
        FirstTitle(first: first, second: second),
        SubTitle(text: text),
      ],
    );
  }
}

library imgform_component;

import 'package:flutter/material.dart';


class ImgForm extends StatefulWidget {
  const ImgForm({Key? key}) : super(key: key);

  @override 
  State<ImgForm> createState() {
    return _ImgFormState();
  }
}

class _ImgFormState extends State<ImgForm>
{
  @override 
  Widget build(BuildContext context)
  {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: 282,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 1, style: BorderStyle.solid),
        borderRadius: const BorderRadius.all(Radius.circular(30))
      ),
      child: Row(
        children: 
        [
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: const Icon(
              Icons.image,
              color: Colors.blue,
            )
          ),
          SizedBox(
            width: 240,
            height: 40,
            child: TextButton(
              onPressed: () {}, 
              child: const Text(
                'Photo de profil',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              )
            ),
          ),
        ],
      ),
    );
  }
}
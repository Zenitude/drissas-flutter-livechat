library inputform_component;

import 'package:flutter/material.dart';

class InputForm extends StatelessWidget {
  const InputForm(
      {Key? key,
      required this.iconName,
      required this.nameField,
      required this.nameController,
      required this.obscure})
      : super(key: key);

  final IconData iconName;
  final String nameField;
  final TextEditingController nameController;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: 282,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 1, style: BorderStyle.solid),
        borderRadius: const BorderRadius.all(Radius.circular(30))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: Icon(
                iconName,
                color: Colors.blue,
              )),
          SizedBox(
            width: 240,
            height: 40,
            child: TextFormField(
              style: const TextStyle(
                color: Colors.white, 
                decoration: TextDecoration.none,
                decorationStyle: TextDecorationStyle.dotted
              ),
              obscureText: obscure,
              controller: nameController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: nameField,
                hintStyle: const TextStyle(
                  color: Colors.white,
                ),
                border: InputBorder.none
              ),
            ),
          )
        ],
      ),
    );
  }
}

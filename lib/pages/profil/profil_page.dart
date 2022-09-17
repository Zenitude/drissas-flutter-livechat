// ignore_for_file: avoid_print, invalid_return_type_for_catch_error

library profil_page;

import 'package:flutter/material.dart';

import 'package:my_app/widgets/appbar_profil_widget.dart';
import 'package:my_app/pages/profil/components/avatar_components.dart';
import 'package:my_app/pages/profil/components/update_component.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  State<ProfilPage> createState() {
    return _ProfilPageState();
  }
}

class _ProfilPageState extends State<ProfilPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBarProfil(),
      body: Column(
        children: const [
          AvatarProfil(),
          UpdateAvatar(),
        ],
      ),
    );
  }
}

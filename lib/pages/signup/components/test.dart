
// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;
FirebaseStorage storage = FirebaseStorage.instance;

signUp(pseudo, mail, password, image)
{
  try
  {
    auth
      .createUserWithEmailAndPassword(
          email: mail.text.trim(),
          password: password.text.trim())
      .then((value) {

        try{
          firestore.collection('users').doc(value.user!.uid).set({
            "pseudo": pseudo.text.trim(),
          }).catchError((e) {
            print(e.error);
          });
        }
        catch(e) { print('Error Firestore Create User : $e');}

        try
        {
          auth
            .signInWithEmailAndPassword(
              email: mail.text.trim(),
              password: password.text.trim())
            .then((value) async {
              
              try
              {
                Reference storageRef = storage
                  .ref('users')
                  .child(value.user!.uid)
                  .child('profil')
                  .child('avatar.png');
              
                UploadTask uploadTask = storageRef.putFile(image!);

                await uploadTask.whenComplete(() => print('File Uploaded'));
              }
              catch(e) { print('Erreur Storage Create User : $e');}
            }).catchError((e) { print('Error : ${e.error}');});
        }
        catch(e) { print('Erreur : $e');}

      }).catchError((e) { print(e.error);});
  }
  catch(e) 
  { print('Erreur : $e');}
}
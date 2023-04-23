import 'dart:io';
import 'dart:ui';

import 'package:desafio_capyba_marcosantonio/widgets/Anexo.dart';
import 'package:desafio_capyba_marcosantonio/pages/photoPreview.dart';
import 'package:flutter/material.dart';
import 'package:camera_camera/camera_camera.dart';
import 'package:get/get.dart';

/* import '../models/User.dart'; */

import 'package:firebase_auth/firebase_auth.dart';


class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

final TextEditingController _createEmailController = TextEditingController();
final TextEditingController _createPasswordController = TextEditingController();

class _SignUpState extends State<SignUp> {

  void _signUp() async {
    try {
      final user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _createEmailController.text,
        password: _createPasswordController.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Your password it too weak')));
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('This email is already in use')));
      }
    } catch (e) {
      print(e);
    }
  }

  File arquivo = File('');

  showPreview(file) async {
    file = await Get.to(() => PreviewPage(file: file));

    if (file != null && file != '') {
      setState(() => arquivo = file);
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up - Desafio Capyba'),
      ),
      backgroundColor: Colors.greenAccent,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /* if (arquivo != null) Anexo(arquivo: arquivo),
            ElevatedButton.icon(
              onPressed: () => Get.to(
                () => CameraCamera(onFile: (file) => showPreview(file)),
              ),
              icon: Icon(Icons.camera_alt),
              label: Padding(
                padding: const EdgeInsets.all(16),
                child: Text('Tire uma foto'),
              ),
            ), */
            TextField(
                controller: _createEmailController,
                autofocus: true,
                keyboardType: TextInputType.text,
                style: TextStyle(color: Colors.green, fontSize: 20),
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(color: Colors.white),
                )),
            TextField(
                controller: _createPasswordController,
                autofocus: true,
                keyboardType: TextInputType.text,
                style: TextStyle(color: Colors.green, fontSize: 20),
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(color: Colors.white),
                )),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    onPressed:
                        /* final String email = _createEmailController.text;
                      final String password = _createPasswordController.text; */
                        /*   final User UserLoggedIn = User(email, password);
                      print(UserLoggedIn); */
                        _signUp,
                    child: Text('Sign up'),
                  ),
                ),
                TextButton(
                    onPressed: () => {Navigator.pushNamed(context, '/login')},
                    child: Text("Already an user? Sign in"))
              ],
            )
          ],
        )),
      ),
    );
  }
}

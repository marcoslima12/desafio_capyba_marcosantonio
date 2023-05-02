import 'dart:io';
import 'dart:ui';

import 'package:desafio_capyba_marcosantonio/pages/LoggedArea.dart';
import 'package:desafio_capyba_marcosantonio/pages/login.dart';
import 'package:desafio_capyba_marcosantonio/widgets/Anexo.dart';
import 'package:desafio_capyba_marcosantonio/widgets/photoPreview.dart';
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

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _createEmailController = TextEditingController();
  final TextEditingController _createPasswordController =
      TextEditingController();
  final TextEditingController _createNameController = TextEditingController();

  bool isLoading = false;

  void _signUp() async {
    try {
      setState(() => isLoading = true);
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _createEmailController.text,
        password: _createPasswordController.text,
      );
      User? user = userCredential.user;
      if (user != null) {
        await user.updateDisplayName(_createNameController.text);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoggedArea()),
        );
      }
      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        await currentUser.sendEmailVerification();
      }
    } on FirebaseAuthException catch (e) {
      setState(() => isLoading = false);
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Your password it too weak')));
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('This email is already in use')));
      } else if (e.code == 'invalid-email') {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Invalid email. Try again')));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Something went wrong. Please, tray again')));
      }
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
        backgroundColor: Colors.greenAccent,
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Center(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/capybaLogo.png', width: 150, height: 150),
                  SizedBox(height: 40),
                  Text(
                    'Sign up',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextFormField(
                          controller: _createNameController,
                          autofocus: true,
                          decoration: InputDecoration(
                              labelText: "Name",
                              labelStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(gapPadding: 5)),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: _createEmailController,
                          autofocus: true,
                          decoration: InputDecoration(
                              labelText: "Email",
                              labelStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(gapPadding: 5)),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: _createPasswordController,
                          autofocus: true,
                          obscureText: true,
                          decoration: InputDecoration(
                              labelText: "Password",
                              labelStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(gapPadding: 5)),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                      onPressed: _signUp,
                      child: Text('Create new account >'),
                    ),
                  ),
                  TextButton(
                      onPressed: () => {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()))
                          },
                      child: Text("Already an user? Login >")),
                  (isLoading)
                      ? Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        )
                      : SizedBox.shrink(),
                ],
              )),
            ),
          ),
        ));
  }
}

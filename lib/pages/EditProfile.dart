import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../widgets/MenuLateral.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  User? currentUser = FirebaseAuth.instance.currentUser;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _newNameController = TextEditingController();
  final TextEditingController _newEmailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool checkedPassword = false;

  void _SubmmitChanges() {
    if (!(_newEmailController.text.trim() == '' ||
        _newNameController.text.trim() == '')) {
    } else {
      //nao mostrar pop up. avisar
    }
  }

  void _updateName() async {
    try {
      await currentUser!.updateDisplayName(_newNameController.text);
      print('Novo nome: ${_newNameController.text}');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Couldn't udpate your name. Please, try again.")));
    }
  }

  void _updateEmail() async {
    try {
      await currentUser!.updateEmail(_newEmailController.text);
      print('Novo email: ${_newEmailController.text}');
      await currentUser!.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('This email is already in use.')));
      } else if (e.code == 'invalid-email') {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Invalid email. Try again')));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Something went wrong. Please, tray again')));
      }
    }
  }

  void _checkPassword() async {
    if (currentUser!.email != null) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: 'marcos.antonio@citi.org.br',
          password: _passwordController.text,
        );
        if (userCredential.user != null) {
          setState(() {
            checkedPassword = true;
          });
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'wrong-password') {
          setState(() {
            checkedPassword = false;
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Something went wrong. Please, tray again')));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    String photoURL = currentUser?.photoURL ??
        "https://media.istockphoto.com/id/1338134336/photo/headshot-portrait-african-30s-man-smile-look-at-camera.jpg?b=1&s=170667a&w=0&k=20&c=j-oMdWCMLx5rIx-_W33o3q3aW9CiAWEvv9XrJQ3fTMU=";
    return Scaffold(
        appBar: AppBar(
          title: Text('Edit Profile'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 220,
                color: Colors.greenAccent,
                child: Padding(
                  padding: EdgeInsets.only(top: 30, left: 30, bottom: 10),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border:
                                  Border.all(color: Colors.white, width: 4)),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(photoURL),
                            radius: 50,
                          ),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text('Photo Upload +',
                                style: TextStyle(fontSize: 18)))
                      ]),
                ),
              ),
              Form(
                  key: _formKey,
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextFormField(
                          controller: _newNameController,
                          autofocus: true,
                          decoration: InputDecoration(
                            labelText: 'Name',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: _newEmailController,
                          autofocus: true,
                          decoration: InputDecoration(
                            labelText: 'E-mail',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: ElevatedButton(
                              onPressed: () {
                                if (!(_newEmailController.text.trim() == '' &&
                                    _newNameController.text.trim() == '')) {
                                  showDialog(
                                    /////////////////////////////////////////
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Password'),
                                        content: Text(
                                            'To save the new information, please enter your password'),
                                        actions: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 10, right: 10),
                                            child: TextFormField(
                                              controller: _passwordController,
                                              autofocus: true,
                                              decoration: InputDecoration(
                                                  labelText: "Password",
                                                  labelStyle: TextStyle(
                                                      color: Colors.green),
                                                  border: OutlineInputBorder(
                                                      gapPadding: 5)),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 10, right: 10, top: 10),
                                            child: Container(
                                                width: double.infinity,
                                                child: ElevatedButton(
                                                    onPressed: () {
                                                      _checkPassword();
                                                      if (checkedPassword ==
                                                          true) {
                                                        if (_newEmailController
                                                                    .text
                                                                    .trim() !=
                                                                '' &&
                                                            _newNameController
                                                                    .text
                                                                    .trim() ==
                                                                '') {
                                                          print('Email');
                                                          _updateEmail();
                                                          Navigator.of(context)
                                                              .pop();
                                                          showDialog(
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return AlertDialog(
                                                                title: Text(
                                                                    'Succsess!'),
                                                                content: Text(
                                                                    'Your information has been updated!'),
                                                                actions: <
                                                                    Widget>[
                                                                  TextButton(
                                                                    child: Text(
                                                                        'Fechar'),
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                    },
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          );
                                                        } else if (_newEmailController
                                                                    .text
                                                                    .trim() ==
                                                                '' &&
                                                            _newNameController
                                                                    .text
                                                                    .trim() !=
                                                                '') {
                                                          print('Nome');

                                                          _updateName();
                                                          Navigator.of(context)
                                                              .pop();
                                                          showDialog(
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return AlertDialog(
                                                                title: Text(
                                                                    'Succsess!'),
                                                                content: Text(
                                                                    'Your information has been updated!'),
                                                                actions: <
                                                                    Widget>[
                                                                  TextButton(
                                                                    child: Text(
                                                                        'Fechar'),
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                    },
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          );
                                                        } else if (_newEmailController
                                                                    .text
                                                                    .trim() !=
                                                                '' &&
                                                            _newNameController
                                                                    .text
                                                                    .trim() !=
                                                                '') {
                                                          print('Ambos');
                                                          _updateEmail();
                                                          _updateName();
                                                          showDialog(
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return AlertDialog(
                                                                title: Text(
                                                                    'Succsess!'),
                                                                content: Text(
                                                                    'Your information has been updated!'),
                                                                actions: <
                                                                    Widget>[
                                                                  TextButton(
                                                                    child: Text(
                                                                        'Fechar'),
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                    },
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          );
                                                          Navigator.of(context)
                                                              .pop();
                                                        } else {
                                                          print('Nenhum');
                                                          {}
                                                        }
                                                      } else {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(SnackBar(
                                                                content: Text(
                                                                    'Wrong password. Try again')));
                                                      }
                                                    },
                                                    child: Text('Enter'))),
                                          ),
                                          TextButton(
                                            child: Text('Fechar'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              'Empty values. Enter new personal information')));
                                }
                              },
                              child: Text('Save'),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ));
  }
}

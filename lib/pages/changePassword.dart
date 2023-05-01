import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  User? currentUser = FirebaseAuth.instance.currentUser;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmNewPassword = TextEditingController();
  bool checkedPassword = false;

  @override
  Widget build(BuildContext context) {
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

    void _updatePassword() async {
      
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Back'),
        ),
        body: Padding(
          padding: EdgeInsets.all(30),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Create new password',
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                Padding(
                    padding: EdgeInsets.only(top: 15, bottom: 30),
                    child: Text(
                      'Your password must be different from previous used passwords',
                      style: TextStyle(fontSize: 17, color: Colors.black45),
                    )),
                TextFormField(
                  controller: _passwordController,
                  autofocus: true,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Your password',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _newPasswordController,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: 'New Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _confirmNewPassword,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: 'Confirm New Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        _checkPassword();
                        if (checkedPassword == true) {
                          if (_newPasswordController == _confirmNewPassword) {
                            /* _updatePassword(); */
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("The passwords don't mach")));
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Wrong password. Try again')));
                        }
                      },
                      child: Text('Save'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';

import '../models/User.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

final TextEditingController _createEmailController = TextEditingController();
final TextEditingController _createPasswordController = TextEditingController();

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
                controller: _createEmailController,
                autofocus: true,
                keyboardType: TextInputType.text,
                style: TextStyle(color: Colors.green, fontSize: 20),
                decoration: InputDecoration(
                  labelText: "Insert an email",
                  labelStyle: TextStyle(color: Colors.white),
                )),
            TextField(
                controller: _createPasswordController,
                autofocus: true,
                keyboardType: TextInputType.text,
                style: TextStyle(color: Colors.green, fontSize: 20),
                decoration: InputDecoration(
                  labelText: "Insert a password",
                  labelStyle: TextStyle(color: Colors.white),
                )),
            ButtonTheme(
                height: 40,
                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                  ),
                  onPressed: () {
                    final String email = _createEmailController.text;
                    final String password = _createPasswordController.text;

                    final User UserLoggedIn = User(email, password);
                    print(UserLoggedIn);
                  },
                  child: Text('Create account'),
                ))
          ],
        )),
      ),
    );
  }
}

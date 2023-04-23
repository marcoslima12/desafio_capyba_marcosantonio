import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

import '../models/User.dart';

import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

class _LoginState extends State<Login> {



  Future<void> _signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login - Desafio Capyba')),
      backgroundColor: Colors.greenAccent,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
                controller: _emailController,
                autofocus: true,
                keyboardType: TextInputType.text,
                style: TextStyle(color: Colors.green, fontSize: 20),
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(color: Colors.white),
                )),
            TextField(
                controller: _passwordController,
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
                      onPressed: _signIn,
                        /* final String email = _emailController.text;
                        final String password = _passwordController.text; */
                        /* final User UserLoggedIn = User(email, password);
                        print(UserLoggedIn); */
                      child: Text('Sign in'),
                    )),
                TextButton(
                    onPressed: () => {Navigator.pushNamed(context, '/signup')},
                    child: Text("Not a user yet? Create an account"))
              ],
            )
          ],
        )),
      ),
    );
  }
}

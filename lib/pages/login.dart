import 'package:desafio_capyba_marcosantonio/pages/LoggedArea.dart';
import 'package:desafio_capyba_marcosantonio/pages/signUp.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

/* import '../models/User.dart'; */

import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

class _LoginState extends State<Login> {
  void _signIn() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      User? user = userCredential.user;
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoggedArea(user!)),
        (Route<dynamic> route) => false,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Email not found. Sign up')));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Wrog password. Try again')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      backgroundColor: Colors.greenAccent,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/capybaLogo.png', width: 100, height: 100),
            TextField(
                controller: _emailController,
                autofocus: true,
                keyboardType: TextInputType.text,
                style: TextStyle(color: Colors.green, fontSize: 20),
                decoration: InputDecoration(
                  icon: Icon(Icons.email_outlined),
                  labelText: "E-mail",
                  labelStyle: TextStyle(color: Colors.white),
                  
                )),
            TextField(
                controller: _passwordController,
                autofocus: true,
                keyboardType: TextInputType.text,
                style: TextStyle(color: Colors.white, fontSize: 20),
                decoration: InputDecoration(
                  icon: Icon(Icons.key_outlined),
                  labelText: "Password",
                  labelStyle: TextStyle(color: Colors.white),
                )),
            Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                      onPressed: _signIn,
                      child: Text('Login to my account >'),
                    )),
                TextButton(
                    onPressed: () => {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUp()))},
                    child: Text("New here? Create an account >"))
              ],
            )
          ],
        ),
      ),
    );
  }
}




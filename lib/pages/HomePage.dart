import 'package:desafio_capyba_marcosantonio/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IsLogged extends StatelessWidget {
  final User _user;

  IsLogged(this._user);

  /* Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e);
    }
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logado - Desafio Capyba'),
      ),
      body: Center(
        child: Text('Área Logada'),
        /* Column(
          mainAxisAlignment: MainAxisAlignment.center,
          child
          /* children: [
            Text('Bem-vindo, ${_user.email}!'),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {},
              child: Text('Sair'),
            ),
          ], */
        ), */
      ),
    );
  }
}

import 'package:desafio_capyba_marcosantonio/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoggedArea extends StatelessWidget {
  final User _user;

  LoggedArea(this._user);

  /* Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e);
    }
  } */

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Logged Area - Desafio Capyba'),
            bottom: const TabBar(
              tabs: [
                Tab(child: Text('Home'),),
                Tab(child: Text('Restrict'),),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              Icon(Icons.house),
              Icon(Icons.lock),
            ],
          ),
        )
        );
  }
}

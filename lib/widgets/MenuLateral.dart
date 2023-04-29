import 'package:desafio_capyba_marcosantonio/pages/LoggedArea.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../pages/login.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  late User _user;

  @override
  Widget build(BuildContext context) {
    void _signOut() async {
      try {
        await FirebaseAuth.instance.signOut();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Login()),
        );
      } catch (e) {
        print(e);
      }
    }

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 200,
            color: Colors.greenAccent,
            child: Container(
              child: Padding(
                padding: EdgeInsets.only(top: 130, left: 20),
                child: Column(children: [
                  Text(
                    'Whole Name',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Whole Name',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ]),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: const Text('Meu perfil'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/my-profile');
            },
          ),
          ListTile(
            leading: Icon(Icons.mail),
            title: const Text('Validar email'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Spacer(),
          ListTile(
            leading: Icon(Icons.logout),
            title: const Text('Sair'),
            onTap: () {
              Navigator.pop(context);
              _signOut();
            },
          ),
        ],
      ),
    );
  }
}

/*  */
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
            height: 220,
            color: Colors.greenAccent,
            child: Container(
              child: Padding(
                padding: EdgeInsets.only(top: 50, left: 30),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: Colors.white, width: 2)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset('assets/man.jpg',
                              width: 70, height: 70),
                        ),
                      ),
                      Text('Marcos Antonio',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                    ]),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: ListTile(
              leading: Icon(Icons.home, color: Colors.green),
              title: const Text('Home', style: TextStyle(color: Colors.green)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: ListTile(
              leading: Icon(Icons.person, color: Colors.green),
              title: const Text('Meu perfil',
                  style: TextStyle(color: Colors.green)),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/my-profile');
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: ListTile(
              leading: Icon(Icons.mail, color: Colors.green),
              title: const Text('Validar email',
                  style: TextStyle(color: Colors.green)),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/validate-email');
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: ListTile(
              leading: Icon(Icons.logout, color: Colors.green),
              title: const Text('Sair', style: TextStyle(color: Colors.green)),
              onTap: () {
                Navigator.pop(context);
                _signOut();
              },
            ),
          ),
        ],
      ),
    );
  }
}

/*  */
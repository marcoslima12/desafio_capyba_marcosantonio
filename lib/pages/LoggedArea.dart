import 'package:desafio_capyba_marcosantonio/pages/login.dart';
import 'package:desafio_capyba_marcosantonio/widgets/MenuLateral.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoggedArea extends StatelessWidget {
  final User _user;

  LoggedArea(this._user);

  @override
  Widget build(BuildContext context) {
    User? currentUser = FirebaseAuth.instance.currentUser;
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

    if (currentUser != null && currentUser.emailVerified) {
      return DefaultTabController(
          length: 2,
          child: Scaffold(
            drawer: DrawerWidget(),
            appBar: AppBar(
              title: Text('Logged Area - Desafio Capyba'),
              bottom: const TabBar(
                tabs: [
                  Tab(
                    child: Text('Home'),
                  ),
                  Tab(
                    child: Text('Restrict'),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                ElevatedButton(onPressed: _signOut, child: Text('SAIR')),
                Center(
                  child: Text('Your email was verified'),
                ),
              ],
            ),
          ));
    } else {
      return DefaultTabController(
          length: 2,
          child: Scaffold(
            drawer: DrawerWidget(),
            appBar: AppBar(
              title: Text('Logged Area - Desafio Capyba'),
              bottom: const TabBar(
                tabs: [
                  Tab(
                    child: Text('Home'),
                  ),
                  Tab(
                    child: Text('Restrict'),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                ElevatedButton(onPressed: _signOut, child: Text('SAIR')),
                Center(child: Text('VERIRICA TEU EMAIL!!')),
              ],
            ),
          ));
    }
  }
}

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return LoggedArea(snapshot.data!);
        } else {
          return Login();
        }
      },
    );
  }
}

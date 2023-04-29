import 'package:desafio_capyba_marcosantonio/pages/login.dart';
import 'package:desafio_capyba_marcosantonio/pages/validateEmail.dart';
import 'package:desafio_capyba_marcosantonio/widgets/MenuLateral.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoggedArea extends StatefulWidget {
  final User _user;
  LoggedArea(this._user);

  @override
  State<LoggedArea> createState() => _LoggedAreaState();
}

class _LoggedAreaState extends State<LoggedArea> {
  @override
  Widget build(BuildContext context) {
    User? currentUser = FirebaseAuth.instance.currentUser;

    Future<bool> _checkEmailVerification(BuildContext context) async {
      User? currentUser = FirebaseAuth.instance.currentUser;
      await currentUser?.reload();
      if (currentUser?.emailVerified == true) {
        return true;
      } else {
        return false;
      }
    }

    return DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: DrawerWidget(),
          appBar: AppBar(
            title: Text('Welcome'),
            bottom: const TabBar(
              tabs: [
                Tab(
                  child: Text('Home'),
                ),
                Tab(
                  child: Text('Restrito'),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Center(child: Text('Home')),
              currentUser != null && currentUser.emailVerified
                  ? Center(child: Text('ok'))
                  : FutureBuilder(
                      future: _checkEmailVerification(context),
                      builder:
                          (BuildContext context, AsyncSnapshot<bool> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text('Erro ao verificar e-mail'));
                        } else if (snapshot.data == true) {
                          return Center(child: Text('ok'));
                        } else {
                          return Center(child: Text('E-mail não verificado'));
                        }
                      },
                    ),
            ],
          ),
        ));
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

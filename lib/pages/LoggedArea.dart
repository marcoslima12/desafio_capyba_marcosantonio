import 'package:desafio_capyba_marcosantonio/pages/login.dart';
import 'package:desafio_capyba_marcosantonio/pages/validateEmail.dart';
import 'package:desafio_capyba_marcosantonio/widgets/MenuLateral.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoggedArea extends StatefulWidget {
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
                  child: Text('Restrict'),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Center(
                  child: Text(
                textAlign: TextAlign.center,
                'Hi, on this page you can see your documents',
                style: TextStyle(fontSize: 20, color: Colors.black54),
              )),
              /*  !(currentUser != null && currentUser.emailVerified)
                  ? Center(
                      child: Text(
                      textAlign: TextAlign.center,
                      'Hi, on this page you can see your documents',
                      style: TextStyle(fontSize: 20, color: Colors.black54),
                    ))
                  : */
              FutureBuilder(
                future: _checkEmailVerification(context),
                builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Erro ao verificar e-mail'));
                  } else if (snapshot.data == true) {
                    return Center(
                        child: Text(
                      textAlign: TextAlign.center,
                      'Now that you have verified your e-mail, you can see these documents too!',
                      style: TextStyle(fontSize: 20, color: Colors.black54),
                    ));
                  } else {
                    return Center(
                        child: Text(
                      textAlign: TextAlign.center,
                      'You must verify your e-mail to see these documents',
                      style: TextStyle(fontSize: 20, color: Colors.black54),
                    ));
                  }
                },
              ),
            ],
          ),
        ));
  }
}

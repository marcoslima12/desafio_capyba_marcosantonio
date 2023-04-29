import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../widgets/MenuLateral.dart';

class ValidateEmail extends StatefulWidget {
  const ValidateEmail({super.key});

  @override
  State<ValidateEmail> createState() => _ValidateEmailState();
}

class _ValidateEmailState extends State<ValidateEmail> {
  @override
  Widget build(BuildContext context) {
    User? currentUser = FirebaseAuth.instance.currentUser;
    bool loading = false;

    void _validateEmail() async {
      setState(() => loading = true);
      try {
        if (currentUser != null) {
          await currentUser.sendEmailVerification();
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Link sent to ${currentUser.email}')));
        }
      } catch (e) {
        print(e);
        setState(() => loading = false);
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Something went wrong. Please try again.')));
      }
    }

    /* if (currentUser != null && currentUser.emailVerified) {
      return Scaffold(
          appBar: AppBar(title: Text('Email validation - Desafio Capyba')),
          body: Center(
            child: Text('Your email is already verified!'),
          ));
    } else { */
      return Scaffold(
        drawer: DrawerWidget(),
        appBar: AppBar(title: Text('E-mail verification')),
        body: Padding(
            padding: EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Text(
                    textAlign: TextAlign.center,
                    'You must verify your e-mail, so you can have access to everything.',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: _validateEmail,
                  child: Text('Send validation link to ${currentUser!.email}'),
                ),
                (loading)
                    ? CircularProgressIndicator(color: Colors.green)
                    : CircularProgressIndicator(color: Colors.transparent)
              ],
            )),
      );
    }
  }
/* }
 */
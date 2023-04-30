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

    return Scaffold(
        drawer: DrawerWidget(),
        appBar: AppBar(title: Text('E-mail verification')),
        body: Center(
          child: Column(
            children: [
              Icon(Icons.email),
              Text('Check your mail', style: TextStyle(fontSize: 25)),
              Text(
                  'We hve sent a password recover instructions to your email.'),
            ],
          ),
        ));
  }
}

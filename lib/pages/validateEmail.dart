import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ValidateEmail extends StatelessWidget {
  const ValidateEmail({super.key});

  @override
  Widget build(BuildContext context) {
    User? currentUser = FirebaseAuth.instance.currentUser;

    void _validateEmail() async {
      if (currentUser != null) {
        await currentUser.sendEmailVerification();
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Link sent to ${currentUser.email}')));
      }
    }

    if (currentUser != null && currentUser.emailVerified) {
      return Scaffold(
          appBar: AppBar(title: Text('Email validation - Desafio Capyba')),
          body: Center(
            child: Text('Your email is already verified!'),
          ));
    } else {
      return Scaffold(
        appBar: AppBar(title: Text('Email validation - Desafio Capyba')),
        body: Center(
            child: ElevatedButton(
          onPressed: _validateEmail,
          child: Text('send another link'),
        )),
      );
    }
  }
}

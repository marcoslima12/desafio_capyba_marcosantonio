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
            child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.email_outlined, size: 100, color: Colors.green),
              SizedBox(height: 30),
              Text('Check your email', style: TextStyle(fontSize: 25)),
              SizedBox(height: 30),
              Text(
                'To confirm your email address, open your mail app.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black45, fontSize: 17),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have a link?",
                    style: TextStyle(color: Colors.black38, fontSize: 15),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Click here',
                        style: TextStyle(fontSize: 18, color: Colors.green),
                      ))
                ],
              )
            ],
          ),
        )));
  }
}

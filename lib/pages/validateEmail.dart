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
  User? curUser = FirebaseAuth.instance.currentUser;
  void _sendAnotherLink() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      await currentUser.sendEmailVerification();
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Link sent to ${currentUser.email}')));
    }
  }

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
        await currentUser?.reload();
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
                child: (!curUser!.emailVerified)
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Verify your account',
                              style: TextStyle(fontSize: 25)),
                          SizedBox(height: 30),
                          Text(
                            'Validation link has been sent to the e-mail address you provided.',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: Colors.black45, fontSize: 17),
                          ),
                          SizedBox(height: 30),
                          Icon(Icons.mark_email_unread,
                              size: 40, color: Colors.green),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Didn't get the link?",
                                style: TextStyle(
                                    color: Colors.black38, fontSize: 15),
                              ),
                              TextButton(
                                  onPressed: _sendAnotherLink,
                                  child: Text(
                                    'Send it again',
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.green),
                                  ))
                            ],
                          )
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Your account has been verified!',
                            style: TextStyle(fontSize: 25),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 30),
                          Text(
                            'Now you can have access to everything!',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: Colors.black45, fontSize: 17),
                          ),
                          SizedBox(height: 30),
                          Icon(Icons.mark_email_read,
                              size: 40, color: Colors.green),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Enjoy our app!",
                                style: TextStyle(
                                    color: Colors.black38, fontSize: 15),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.popAndPushNamed(context, 'home');
                                  },
                                  child: Text(
                                    'Home',
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.green),
                                  ))
                            ],
                          )
                        ],
                      ))));
  }
}

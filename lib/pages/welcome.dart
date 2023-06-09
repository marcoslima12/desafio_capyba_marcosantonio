import 'package:desafio_capyba_marcosantonio/pages/login.dart';
import 'package:desafio_capyba_marcosantonio/pages/signUp.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text('Welcone - Desafio Capyba')),
      backgroundColor: Colors.greenAccent,
      body: Center(
          child: Padding(
        padding: EdgeInsets.all(30),
      
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          Image.asset('assets/capybaLogo.png', width: 250, height: 250),
          Text('Hey! Welcome',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          SizedBox(height: 15),
          Text(
              "It's a pleasure to have you here. This app was made with too much effort and loving",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black45, fontSize: 17)),
              SizedBox(height: 15),
          Container(
            width: double.infinity,
            child: ElevatedButton(onPressed: () {
                Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SignUp()),
        );
            }, child: Text('Get started')),
          ),
          SizedBox(height: 15),
          TextButton(
              onPressed: () {
                  Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Login()),
        );
              },
              child: Text(
                'I already have an account',
                style: TextStyle(fontSize: 16),
              ))
        ]),
      )),
    );
  }
}

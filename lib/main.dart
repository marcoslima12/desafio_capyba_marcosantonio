import 'package:desafio_capyba_marcosantonio/widgets/login.dart';
import 'package:desafio_capyba_marcosantonio/widgets/signUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:desafio_capyba_marcosantonio/widgets/welcomePage.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Desafio Capyba',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: WelcomePage(),
    );
  }
}

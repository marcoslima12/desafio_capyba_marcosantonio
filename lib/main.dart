import 'package:desafio_capyba_marcosantonio/pages/login.dart';
import 'package:desafio_capyba_marcosantonio/pages/signUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:desafio_capyba_marcosantonio/pages/welcome.dart';
import 'package:get/get.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Desafio Capyba',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: WelcomePage(),
      routes: {
        '/login': (context) => Login(),
        '/signup': (context) => SignUp(),
      },
    );
  }
}

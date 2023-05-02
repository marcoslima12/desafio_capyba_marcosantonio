import 'package:desafio_capyba_marcosantonio/pages/EditProfile.dart';
import 'package:desafio_capyba_marcosantonio/pages/LoggedArea.dart';
import 'package:desafio_capyba_marcosantonio/pages/changePassword.dart';
import 'package:desafio_capyba_marcosantonio/pages/login.dart';
import 'package:desafio_capyba_marcosantonio/pages/signUp.dart';
import 'package:desafio_capyba_marcosantonio/pages/validateEmail.dart';
import 'package:flutter/material.dart';
import 'package:desafio_capyba_marcosantonio/pages/welcome.dart';
import 'package:get/get.dart';

import 'package:firebase_core/firebase_core.dart';

import 'pages/meuPerfil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

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
        '/validate-email': (context) => ValidateEmail(),
        '/my-profile': (context) => MyProfile(),
        '/edit-profile': (context) => EditProfile(),
         '/change-password': (context) => ChangePassword(),
         '/home': (context) => LoggedArea(),
      
      },
    );
  }
}

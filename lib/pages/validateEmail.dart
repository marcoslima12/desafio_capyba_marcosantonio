import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ValidateEmail extends StatelessWidget {
  const ValidateEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Email validation - Desafio Capyba')),
      body: Center(child: Text('A validation link was sent to yor email.')),
    );
  }
}

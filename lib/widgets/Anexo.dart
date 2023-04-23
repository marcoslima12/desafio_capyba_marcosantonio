import 'dart:io';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class Anexo extends StatelessWidget {
  final File arquivo;

  Anexo({super.key, required this.arquivo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24),
      child: Center(
          child: SizedBox(
        width: 100,
        height: 100,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.file(arquivo, fit: BoxFit.cover),
        ),
      )),
    );
  }
}

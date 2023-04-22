import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Welcome",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(),
                        onPressed: () => {},
                        child: Text("Sign In")),
                    SizedBox(width: 40),
                    ElevatedButton(onPressed: () => {}, child: Text("Sign ")),
                  ],
                )
              ]),
        ),
      ),
    );
  }
}

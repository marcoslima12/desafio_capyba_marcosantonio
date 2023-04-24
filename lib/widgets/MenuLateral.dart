import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 200,
            color: Colors.greenAccent,
            child: Container(
              child: Padding(
                padding: EdgeInsets.only(top: 130, left: 20),
                child: Column(children: [
                  Text(
                    'Whole Name',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Whole Name',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ]),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: const Text('Meu perfil'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/my-profile');
            },
          ),
          ListTile(
            leading: Icon(Icons.mail),
            title: const Text('Validar email'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/validate-email');
            },
          ),
        ],
      ),
    );
  }
}

/*  */
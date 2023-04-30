import 'package:desafio_capyba_marcosantonio/widgets/MenuLateral.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerWidget(),
        appBar: AppBar(
          title: Text('Meu perfil'),
          centerTitle: true,
          actions: [
            ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.edit_outlined),
                label: Text('Editar'),
                )
          ],
        ),
        body: Center(
            child: Column(children: [
          Container(
            width: double.infinity,
            height: 200,
            color: Colors.green,
            child: Center(
                child: ClipRRect(
              borderRadius: BorderRadius.circular(100.0), // raio dos cantos
              child: Image.asset('assets/man.jpg', width: 100, height: 100),
            )),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30, bottom: 15, top: 30),
            child: Row(
              children: [
                Icon(Icons.person),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nome', style: TextStyle(fontWeight: FontWeight.w500)),
                    Text('Marcos Antonio')
                  ],
                )
              ],
            ),
          ),
          Divider(
            thickness: 1,
            color: Colors.grey[400],
            indent: 20,
            endIndent: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30, bottom: 15, top: 15),
            child: Row(
              children: [
                Icon(Icons.email),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('E-mail',
                        style: TextStyle(fontWeight: FontWeight.w500)),
                    Text('${currentUser!.email}')
                  ],
                )
              ],
            ),
          ),
          Divider(
            thickness: 1,
            color: Colors.grey[400],
            indent: 20,
            endIndent: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30, bottom: 15, top: 15),
            child: Row(
              children: [
                Icon(Icons.calendar_month),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Member since',
                        style: TextStyle(fontWeight: FontWeight.w500)),
                    Text('${currentUser!.metadata.creationTime!.year}')
                  ],
                )
              ],
            ),
          )
        ])));
  }
}

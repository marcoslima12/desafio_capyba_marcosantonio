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
  bool isEditing = false;
  final TextEditingController _newEmailController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerWidget(),
        appBar: AppBar(
          title: Text('Meu Perfil'),
          centerTitle: true,
        ),
        body: Column(children: [
          Container(
            width: double.infinity,
            height: 220,
            color: Colors.greenAccent,
            child: Padding(
              padding: EdgeInsets.only(top: 30, left: 30, bottom: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: Colors.white, width: 4)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset('assets/man.jpg',
                            width: 90, height: 90),
                      ),
                    ),
                    Text('Marcos Antonio',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                    Text(
                      '${currentUser!.email}',
                      style: TextStyle(color: Colors.black45),
                    )
                  ]),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/edit-profile');
            },
            child: Padding(
              padding: EdgeInsets.only(top: 15, left: 30, bottom: 15),
              child: Row(children: [
                Icon(Icons.edit_outlined),
                SizedBox(width: 20),
                Text('Edit Profile'),
                Icon(Icons.arrow_circle_right)
              ]),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Padding(
              padding: EdgeInsets.only(top: 15, left: 30, bottom: 15),
              child: Row(children: [
                Icon(Icons.password_outlined),
                SizedBox(width: 20),
                Text('Change Password'),
                Icon(Icons.arrow_circle_right)
              ]),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Padding(
              padding: EdgeInsets.only(top: 15, left: 30, bottom: 15),
              child: Row(children: [
                Icon(Icons.logout_outlined),
                SizedBox(width: 20),
                Text('Sair'),
                Icon(Icons.arrow_circle_right)
              ]),
            ),
          ),
        ]));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets/MenuLateral.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController _newNameController = TextEditingController();
  final TextEditingController _newEmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 220,
            color: Colors.greenAccent,
            child: Padding(
              padding: EdgeInsets.only(top: 30, left: 30, bottom: 10),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
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
                    TextButton(
                        onPressed: () {},
                        child: Text('Photo Upload +',
                            style: TextStyle(fontSize: 18)))
                  ]),
            ),
          ),
          Padding(
              padding:
                  EdgeInsets.only(top: 15, left: 30, bottom: 15, right: 30),
              child: TextField(
                controller: _newNameController,
                autofocus: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: UnderlineInputBorder(),
                ),
              )),
          Padding(
              padding:
                  EdgeInsets.only(top: 15, left: 30, bottom: 15, right: 30),
              child: TextField(
                controller: _newEmailController,
                autofocus: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: UnderlineInputBorder(),
                ),
              )),
              ElevatedButton(onPressed: (){}, child: Text('Save')),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _formKey = GlobalKey<FormState>();
  String? _name = '';
  final TextEditingController _password = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmNewPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Back'),
        ),
        body: Padding(
          padding: EdgeInsets.all(30),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Create new password',
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                Padding(
                    padding: EdgeInsets.only(top: 15, bottom: 30),
                    child: Text(
                      'Your password must be different from previous used passwords',
                      style: TextStyle(fontSize: 17, color: Colors.black45),
                    )),
                TextFormField(
                  controller: _password,
                  autofocus: true,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Your password',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _newPasswordController,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: 'New Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _confirmNewPassword,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: 'Confirm New Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Save'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

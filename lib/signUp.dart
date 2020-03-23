import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class signUp extends StatefulWidget {
  @override
  _signUpState createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  var formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var email, password;
//--------------------------------------------------------------//
  TextEditingController t1 = new TextEditingController();
  TextEditingController t2 = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: <Widget>[
          Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(20),
                  child: TextFormField(
                    validator: (String value) {
                      if (!value.contains('@'))
                        return 'invalid Email';
                      else
                        return null;
                    },
                    onSaved: (value) {
                      email = value;
                    },
                    controller: t1,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: 'abc@exampale.com', labelText: 'Email'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: TextFormField(
                    validator: (String value) {
                      if (value.length <= 6)
                        return 'length should be atlest 6';
                      else
                        return null;
                    },
                    onSaved: (value) {
                      password = value;
                    },
                    controller: t2,
                    keyboardType: TextInputType.visiblePassword,
                    keyboardAppearance: Brightness.dark,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                  ),
                ),
                RaisedButton(
                  color: Colors.lightBlue,
                  onPressed: () {
                    onClick();
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<Void> onClick() async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user;
      t1.clear();
      t2.clear();
      Navigator.of(context).pushNamed('login');
    }
  }
}

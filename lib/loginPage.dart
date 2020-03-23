import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class loginPage extends StatefulWidget {
  @override
  State<loginPage> createState() {
    return _loginPageState();
  }
}

var email, password;

class _loginPageState extends State<loginPage> with TickerProviderStateMixin {
/*Animators and Animations Declaration*/

//--------------------------------------------------------------//

  var formKey = GlobalKey<FormState>();
//--------------------------------------------------------------//
//--------------------------------------------------------------//
  TextEditingController t1 = new TextEditingController();
  TextEditingController t2 = new TextEditingController();

  //-------------------------------------------------------------//
  Future<void> onClick(BuildContext context) async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      try {
        AuthResult user =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        t1.clear();
        t2.clear();
        Navigator.of(context).pushNamed("home");
      } catch (e) {
        print(e.message);
      }
    }
  }

  //------------------------------------------------------------//

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image(
              color: Colors.black54,
              colorBlendMode: BlendMode.darken,
              alignment: Alignment(.5, 0),
              fit: BoxFit.fitHeight,
              image: AssetImage("images/backGround.jpeg"),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                  image: AssetImage("images/nmitLogo.jpg"),
                  height: 160,
                  width: 160,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 60),
                ),
                Form(
                    key: formKey,
                    child: Theme(
                      data: ThemeData(
                          brightness: Brightness.dark,
                          inputDecorationTheme: InputDecorationTheme(
                            labelStyle: TextStyle(
                              height: 1.0,
                              color: Colors.white,
                              fontSize: 22.0,
                              fontFamily: "Assistant",
                              fontWeight: FontWeight.w700,
                            ),
                          )),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(left: 40, right: 40),
                            child: TextFormField(
                                validator: (String value) {
                                  if (!value.contains('@')) {
                                    return 'Enter a valid Email address';
                                  } else
                                    return null;
                                },
                                onSaved: (String input) {
                                  email = input;
                                },
                                controller: t1,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  labelText: "Email Address",
                                )),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 40, right: 40),
                            child: TextFormField(
                              obscureText: true,
                              validator: (String value) {
                                if (value.length < 6) {
                                  return 'Password should be atleast 6 characters long';
                                } else
                                  return null;
                              },
                              onSaved: (String input) {
                                password = input;
                              },
                              controller: t2,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                labelText: "PassWord",
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 20),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                FlatButton(
                                    color: Colors.grey,
                                    onPressed: () {
                                      onClick(context);
                                    },
                                    child: Row(
                                      children: <Widget>[
                                        Text('Login'),
                                        Icon(
                                          Icons.navigate_next,
                                          size: 35,
                                        ),
                                      ],
                                    )),
                                Container(
                                  padding: EdgeInsets.all(20),
                                ),
                                FlatButton(
                                    color: Colors.grey,
                                    onPressed: () {
                                      Navigator.of(context).pushNamed('signUp');
                                    },
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          'Sign Up?',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Icon(
                                          Icons.add,
                                          size: 35,
                                        ),
                                      ],
                                    ))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

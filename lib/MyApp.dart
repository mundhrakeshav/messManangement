import 'package:flutter/material.dart';
import 'loginPage.dart';
import 'bookSlot.dart';
import 'qr.dart';
import 'signUp.dart';
import 'homePage.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: "MESS",
      home: loginPage(),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        "a": (BuildContext context) => slotLayout(),
        "b": (BuildContext context) => qr(),
        "signUp": (BuildContext context) => signUp(),
        "login": (BuildContext context) => loginPage(),
        "home": (BuildContext context) => homePage(),
      },
    );
  }
}

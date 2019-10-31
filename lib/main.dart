import 'package:flutter/material.dart';

import 'src/pages/cooperative_page.dart';
import 'src/pages/home_page.dart';
import 'src/pages/login_page.dart';
import 'src/pages/register_page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: Color.fromRGBO(245, 115, 127, 1.0),
      ),
      initialRoute: 'login',
      routes: {
        'login'        : (BuildContext context) => LoginPage(),
        'home'         : (BuildContext context) => HomePage(),
        'register'     : (BuildContext context) => RegisterPage(),
        'cooperative' : (BuildContext context) => CooperativePage(),
      },
    );
  }
}


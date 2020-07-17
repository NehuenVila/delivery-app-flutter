import 'package:delivery_prueba1/src/pages/login_op_page.dart';
import 'package:delivery_prueba1/src/pages/principal_page.dart';
import 'package:delivery_prueba1/src/pages/sign_up_page.dart';
import 'package:delivery_prueba1/src/pages/user_profile_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        //home: HomePage()
      initialRoute: '/p',
      routes: {
        '/': (context) => LoginScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/p': (context) => PrincipalPage(),
        '/s': (context) => SignUpPage(),
        '/pu': (context) => ProfileScreen(),
      },
    );
  }
}

import 'package:delivery_prueba1/src/pages/home_page.dart';
import 'package:delivery_prueba1/src/pages/login_op_page.dart';
import 'package:delivery_prueba1/src/pages/tab_navegator.dart';
import 'package:delivery_prueba1/src/pages/sign_up_page.dart';
import 'package:delivery_prueba1/src/pages/user_profile_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());
//original
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        //home: HomePage()
      initialRoute: '/',
      routes: {
        '/': (context) => TabPage(),
        '/log': (context) => LoginScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/h': (context) => HomePage(),
        '/s': (context) => SignUpPage(),
        '/pu': (context) => ProfileScreen(),
      },
    );
  }
}

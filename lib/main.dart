
import 'package:delivery_prueba1/src/utils/routes_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';


void main() {
  runApp(
    Phoenix(
      child: MyApp(),
    ),
  );
}
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
//        home: HomePage(),
      initialRoute: '/'/*(Controller.login)?'/':'log'*/,
      routes: getRoutes(),

//      routes: {
//        '/': (context) => TabPage(),
//        '/log': (context) => LoginScreen(),
//        // When navigating to the "/second" route, build the SecondScreen widget.
//        '/h': (context) => HomePage(),
//        '/s': (context) => SignUpPage(),
//        '/pu': (context) => ProfileScreen(),
//      },
    );
  }
}

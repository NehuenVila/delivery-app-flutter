
import 'package:delivery_prueba1/src/utils/controller_util.dart';
import 'package:delivery_prueba1/src/utils/login_state_util.dart';
import 'package:delivery_prueba1/src/utils/routes_util.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp app = await Firebase.initializeApp();
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
      initialRoute: (Controller.isLoggedIn)?'/':'log',
      routes: getRoutes(),
    );




    // PROVIDER MANEJO DE LOGIN FALTA TERMINAR EL NOTIFIER
    // var state = Provider.of<LoginState>(context);
    // return ChangeNotifierProvider<LoginState>(
    //   create: (BuildContext context) => LoginState(),
    //   child: MaterialApp(
    //           debugShowCheckedModeBanner: false,
    //           initialRoute: (state.isLoggeIn())?'/':'log',
    //           routes: getRoutes(),
    //         ),
    // );
      }
}

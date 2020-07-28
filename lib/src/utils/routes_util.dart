import 'package:delivery_prueba1/src/pages/categorias_page.dart';
import 'package:delivery_prueba1/src/pages/home_page.dart';
import 'package:delivery_prueba1/src/pages/login_op_page.dart';
import 'package:delivery_prueba1/src/pages/sign_up_page.dart';
import 'package:delivery_prueba1/src/pages/tab_navegator.dart';
import 'package:delivery_prueba1/src/pages/tienda_page.dart';
import 'package:delivery_prueba1/src/pages/user_profile_page.dart';
import 'package:flutter/material.dart';


Map<String, WidgetBuilder> getRoutes(){
  return <String, WidgetBuilder>{
    '/'    : (BuildContext context) => TabPage(),
    'log'  : (BuildContext context) => LoginScreen(),
    'h'    : (BuildContext context) => HomePage(),
    's'    : (BuildContext context) => SignUpPage(),
    'pu'   : (BuildContext context) => ProfileScreen(),
    'ca'   : (BuildContext context) => CategoriasPage(),
    'ti'   : (BuildContext context) => TiendaPage(),
  };
}
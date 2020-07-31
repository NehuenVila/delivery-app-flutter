

import 'package:delivery_prueba1/src/entities/tienda_profile.dart';
import 'package:delivery_prueba1/src/pages/tienda_page.dart';
import 'package:delivery_prueba1/src/utils/controller_util.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';



// ignore: must_be_immutable
class CategoriasPage extends StatelessWidget {

 List <Tienda> tiendas = [];

 Tienda verduFavio = Tienda( "1" ,"Verduleria faviola", "assets/logos/banana.jpg", "de 15 a 19", 2.5,
     "frente al messi", "Las mejores bananas", "3544410861", "verduleria");


  @override
  Widget build(BuildContext context) {
    tiendas.add(verduFavio);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black,),
        title: Text(Controller.categoria, style: TextStyle(color: Colors.black)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(icon: Icon(LineAwesomeIcons.search, color: Colors.black,), onPressed: ()=> print (Text('Buscar')))
        ],
//        flexibleSpace: ,
      ),
      body: Container(
        child: ListView(
          children: _listaItems(tiendas, context),
        ),
      ),
    );
  }


  List<Widget> _listaItems(List<Tienda> data, BuildContext context) {
    final List<Widget> listaux = [];


    data.forEach((item) {
      final widgetTemp = ListTile(
        title: Text(item.nombre),
        leading: CircleAvatar(backgroundImage: AssetImage(item.logo), radius: 25,),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue,),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => TiendaPage()));
          Controller.identificadorTienda = item.nombre;
        },
        contentPadding: EdgeInsets.all(25),
      );
      listaux..add(widgetTemp)
             ..add(Divider());
    });
    return listaux;
  }
}
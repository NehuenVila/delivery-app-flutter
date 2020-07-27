import 'package:delivery_prueba1/src/utils/controller_util.dart';
import 'package:flutter/material.dart';



class CategoriasPage extends StatelessWidget {

  var Categoria = {
    "titulo": "Favio",
//    "img": "IMG"
  };


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Controller.categoria),
      ),
      body: Container(
        child: _listaItems(Categoria, context),


      ),
    );
  }

  List<Widget> _listaItems(Map data, BuildContext context) {
    final Map opciones = {};

    data.forEach((item) {
      final widgetTemp = ListTile(
        title: Text(item['titulo']),
        onTap:() {},
      );
      opciones..add(widgetTemp)
        ..add(Divider());
    });
    return opciones;
  }
}

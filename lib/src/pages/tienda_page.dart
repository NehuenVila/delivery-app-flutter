import 'package:delivery_prueba1/src/utils/controller_util.dart';
import 'package:flutter/material.dart';



class TiendaPage extends StatefulWidget {
  @override
  _TiendaPageState createState() => _TiendaPageState();
}

class _TiendaPageState extends State<TiendaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(Controller.identificadorTienda),
      ),
    );
  }
}


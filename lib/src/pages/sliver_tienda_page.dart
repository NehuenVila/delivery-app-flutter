import 'package:delivery_prueba1/src/utils/controller_util.dart';
import 'package:flutter/material.dart';



class sliverTiendaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 150,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              Controller.identificadorTienda,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    );
  }
}

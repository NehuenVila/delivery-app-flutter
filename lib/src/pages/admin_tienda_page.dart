import 'package:flutter/material.dart';


class AdminTienda extends StatefulWidget {
  @override
  _AdminTiendaState createState() => _AdminTiendaState();
}

class _AdminTiendaState extends State<AdminTienda> {

  bool aux = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF478DE0),
                  Color(0xFF61A4F1),
                  Color(0xFF73AEF5),
                  Color(0xFF80AEF5),
                ],
                stops: [ 0.1, 0.46, 0.52, 0.75 /*, 1*/
                ],
              ),
            ),
          ),
          Container()
        ],
      ),
    );
  }
}

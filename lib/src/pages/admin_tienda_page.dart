import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


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
          Container(
            child: (aux)?_creatTienda():_administrarTienda(),
          ),
//          if (aux) {
//
//          }
        ],
      ),
    );
  }

  Widget _creatTienda() {
    return Container(

      padding: EdgeInsets.symmetric(
        horizontal: 25.0,
        vertical: 120.0,
      ),
      child: Column(
        children: <Widget>[
          Text('Publica tus productos en nuestra app', style: TextStyle(fontSize: 30,color: Colors.white), textAlign: TextAlign.center,),
          SizedBox(height: 275,),
          RaisedButton(
            onPressed: () {
              print('Tienda Solicitada');
            },
            elevation: 5,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            color: Colors.blueAccent,
            child: Text('Solicitar Ahora', style: TextStyle(fontSize: 18,color: Colors.white),),
          ),
        ],
      ),
    );
  }

  Widget _administrarTienda(){
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 25.0,
        vertical: 120.0,
      ),
      child: Center(
        child: Text('Administrar Tienda'),
      ),
    );
  }
}

import 'package:delivery_prueba1/src/utils/constants.dart';
import 'package:flutter/cupertino.dart';
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
          Container(
            child: (aux)?_creatTienda():_administrarTienda(),
          ),
        ],
      ),
    );
  }

  Widget _creatTienda() {
    return Container(
      height: double.infinity,
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(
          vertical: 120,
          horizontal: 0,
        ),
        child: Column(
          children: <Widget>[
            Text('Publica tus productos en nuestra app', style: TextStyle(fontSize: 30,color: Colors.white), textAlign: TextAlign.center,),
            SizedBox(height: 275,),
            RaisedButton(
              onPressed: () {
                setState(() {
                  aux = false;
                });
                print('Tienda Solicitada');
              },
              elevation: 5,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              color: Colors.blueAccent,
              child: Text('Solicitar Ahora', style: TextStyle(fontSize: 18,color: Colors.white,fontFamily: 'OpenSans',),),
            ),
            SizedBox(height: 30,),
            FlatButton(
              splashColor: Colors.blueAccent,
              onPressed: () {
                print('Alert De Acuerdos, Terminos, Condiciones, etc.');
                _termAlert(context);
              },
              child: Text('Ver Terminos y Condiciones.', style: kLabelStyle)),
          ],
        ),
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


  void _termAlert(BuildContext context){
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context){
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)
            ),
            title: Text('Terminos y Condiciones'),
            content: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris tempor, tortor id accumsan posuere, tortor nisl interdum metus, et egestas libero ante et nulla. Nam aliquam diam nec libero ultrices, bibendum scelerisque nulla efficitur. Curabitur porta ex vel ante commodo venenatis. Nunc tristique tincidunt urna, vel vestibulum augue placerat consequat.'
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris tempor, tortor id accumsan posuere, tortor nisl interdum metus, et egestas libero ante et nulla. Nam aliquam diam nec libero ultrices, bibendum scelerisque nulla efficitur. Curabitur porta ex vel ante commodo venenatis. Nunc tristique tincidunt urna, vel vestibulum augue placerat consequat.'
                ''),
            actions: <Widget>[
              FlatButton(
                child: Text('VOLVER'),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          );
        }
    );
  }
}

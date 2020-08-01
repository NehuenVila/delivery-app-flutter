import 'package:delivery_prueba1/src/entities/tienda_profile.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_rating_bar/flutter_rating_bar.dart';



class TiendaPage extends StatefulWidget {
  @override
  _TiendaPageState createState() => _TiendaPageState();
}

class _TiendaPageState extends State<TiendaPage> {

  Tienda verduFavio = Tienda( "1" ,"Verduleria faviola", "assets/logos/banana.jpg", "de 15 a 19", 2.5,
      "frente al messi", "Las mejores bananas", "3544410861", "verduleria");

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
        height: double.infinity,
        child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(
        horizontal: 40.0,
        vertical: 65.0,
          ),
          child: Column(

            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[_buildImage(),],
              ),
              SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Text(
                  verduFavio.nombre, style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'OpenSans',
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
                ),],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                ],
              ),
            ],
          ),
        ),
      )
    ]
    )
    );
  }

  Widget _buildImage() {
    return GestureDetector(
      child: Container(
        height: 110.0,
        width: 110.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image:  AssetImage(verduFavio.logo),
          ),
        ),
      ),
    );
  }

}


import 'package:delivery_prueba1/src/entities/pedidos.dart';
import 'package:delivery_prueba1/src/entities/tienda_profile.dart';
import 'package:delivery_prueba1/src/entities/usuario.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class PedidosPage extends StatefulWidget {
  @override
  _PedidosPageState createState() => _PedidosPageState();
}

class _PedidosPageState extends State<PedidosPage> {

List<Pedido> pedidos = [];


  @override
  Widget build(BuildContext context) {

    Tienda verduFavio = Tienda( "1" ,"Verduleria faviola", "assets/logos/banana.jpg", "de 15 a 19", 2.5,
        "frente al messi", "Las mejores bananas", "3544410861", "verduleria");

    Usuario usuario = new Usuario('3', 'Nehuen', 'Nehuenvila15@gmail.com');

    Pedido pd = Pedido("2", "25/6/2020", usuario, verduFavio, "2kg banana");

    pedidos.add(pd);
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
            padding: EdgeInsets.symmetric(
              vertical: 50,
              horizontal: 10,

            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Tus Pedidos', style: TextStyle(color: Colors.white, fontSize: 30.0, fontFamily: 'OpenSans'),),
                SizedBox(height: 10),
                Divider(),
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: _listaPedidos(pedidos, context),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _listaPedidos(List<Pedido> data, BuildContext context){
    final List<Widget> listaux = [];


    data.forEach((item) {
      final widgetTemp = ListTile(
        title: Text(item.servicio),
        subtitle: Text(item.tienda.nombre +" "+ item.fecha),
        leading: CircleAvatar(backgroundImage: AssetImage(item.tienda.logo), radius: 25,),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue,),
        dense: true,
        onTap: (){},
      );
      listaux..add(widgetTemp)
        ..add(Divider());
    });
    return listaux;
  }
}

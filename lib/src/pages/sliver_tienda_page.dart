import 'package:delivery_prueba1/src/entities/productos.dart';
import 'package:delivery_prueba1/src/entities/usuario.dart';
import 'package:delivery_prueba1/src/utils/controller_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:delivery_prueba1/src/utils/controller_util.dart';
import 'package:delivery_prueba1/src/entities/tienda_profile.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:delivery_prueba1/src/utils/constants.dart';




class SliverTiendaPage extends StatefulWidget {
  @override
  _SliverTiendaPageState createState() => _SliverTiendaPageState();
}

class _SliverTiendaPageState extends State<SliverTiendaPage> {

  List<Producto> producto = [];

  @override
  Widget build(BuildContext context) {
    Tienda verduFavio = Tienda(
        "1",
        "Verduleria faviola",
        "assets/logos/banana.jpg",
        "de 15 a 19",
        2.5,
        "frente al messi",
        "Las mejores bananas",
        "3544410861",
        "verduleria");

    Usuario usuario = new Usuario('3', 'Nehuen', 'Nehuenvila15@gmail.com');

    Producto papas = Producto(
      "1",
      "Papas",
      verduFavio,
      true,
      20.0,
      usuario,
      1.0,);

    producto.add(papas);
    producto.add(papas);

    return SafeArea(
      child: Material(
        child: Stack(
          children: <Widget>[
            CustomScrollView(
              slivers: <Widget>[
                SliverPersistentHeader(
                  delegate: _sliverAppBarTienda(expandedHeight: 300),
                  pinned: true,
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    _listaPedidos(producto, context)
                  )
                ),
              ],
            ),
            Positioned(
              bottom: 15,
              right: 5,
              left: 5,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: -2,
                          blurRadius: 6,
                          offset: Offset(0, 2)
                      )
                    ]
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(5),
                      height: 30,
                      color: Colors.white70,
                      child: Center(
                          child: Text('TOTAL : ')
                      ),
                    ),
                    RaisedButton(
                      onPressed: () => print('Comprado'),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      color: Colors.blueAccent,
                      child: Text('COMPRAR'),
                      padding: EdgeInsets.symmetric(
                          vertical: 10, horizontal: 25),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _listaPedidos(List<Producto> data, BuildContext context){
    final List<Widget> listaux = [];


    data.forEach((item) {
      final widgetTemp = ListTile(
        title: Text(item.nombre),
        subtitle: Text(item.cantidad.toString()+" "+"kg."),
        leading: CircleAvatar(backgroundImage: AssetImage(item.tienda.logo), radius: 25,),
        trailing: Checkbox(value: false, onChanged: null),
        onTap: (){

        },
      );
      listaux..add(widgetTemp)
             ..add(Divider());
    });
    return listaux;
  }

}

class _sliverAppBarTienda extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  List <Tienda> tiendas = [];

  Tienda verduFavio = Tienda( "1" ,"Verduleria faviola", "assets/logos/banana.jpg", "de 15 a 19", 2.5,
      "frente al messi", "Las mejores bananas", "3544410861", "verduleria");
  Tienda bananeriaVila = Tienda( "2" ,"Platanos del Naldo", "assets/logos/logo.jpg", "de 08 a 20", 2.5,
      "Fan de Messi", "Oferta de goles del Chew", "3544410261", "verduleria");


  _sliverAppBarTienda({@required this.expandedHeight});


  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30)
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF478DE0),
                Color(0xFF61A4F1),
                Color(0xFF73AEF5),
              ],
              stops: [ 0.1, 0.52, 0.9],
            ),
          ),
        ),
        Opacity(
          opacity: 1 - shrinkOffset / expandedHeight ,
          child: Center(
              child: Text(
                Controller.identificadorTienda,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'OpenSans',
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Positioned(
          top: expandedHeight/1.85 - shrinkOffset / 3,
          left: MediaQuery.of(context).size.width / 3,
          child: Opacity(
            opacity: 1 - shrinkOffset / expandedHeight ,
            child: RatingBar(
              itemSize: 20,
              initialRating: 0,
              minRating: 0,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 2),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.white,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
          ),
        ),
        Positioned(
          top: expandedHeight / 27 - shrinkOffset / 3,
          left: MediaQuery.of(context).size.width / 3,
          child: Opacity(
            opacity: 1 - shrinkOffset / expandedHeight,
            child: CircleAvatar(
              radius: MediaQuery.of(context).size.width / 6.7,
              backgroundColor: Colors.transparent,
              child: Hero(
                tag: verduFavio.id,
                child: CircleAvatar(
                  radius: MediaQuery.of(context).size.width / 7,
                  backgroundImage: AssetImage(verduFavio.logo),
                ),
              ),
            ),
          )
        ),
        Positioned(
          top: expandedHeight / 1.55 - shrinkOffset ,
          left: MediaQuery.of(context).size.width / 20,
          child: Opacity(
            opacity: 1 -  shrinkOffset / expandedHeight ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(LineAwesomeIcons.what_s_app, color: Colors.white,),
                    SizedBox(width: 10,),
                    Text(verduFavio.telefono,style: TextStyle(color: Colors.white)),
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  children: <Widget>[
                    Icon(LineAwesomeIcons.clock, color: Colors.white,),
                    SizedBox(width: 10,),
                    Text(verduFavio.horario, style: TextStyle(color: Colors.white),),
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  children: <Widget>[
                    Icon(LineAwesomeIcons.map, color: Colors.white,),
                    SizedBox(width: 10,),
                    Text(verduFavio.direccion, style: TextStyle(color: Colors.white),),
                  ],
                )
              ],
            ),
          ),
        ),
        Center(
          child: Opacity(
            opacity: shrinkOffset / expandedHeight,
//            child: _buildBuscador(context),
            child: Text('Categorias',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;

}

import 'package:delivery_prueba1/src/pages/categorias_page.dart';
import 'package:delivery_prueba1/src/utils/constants.dart';
import 'package:delivery_prueba1/src/utils/controller_util.dart';
import 'package:delivery_prueba1/src/utils/lista_promos_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
//              color: Colors.white
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
//                    Colors.blue,
//                    Colors.blue[400],
//                    Colors.blue[300],
//                    Colors.blue[100]
//                    Color(0xFF398AE5),
                      Color(0xFF478DE0),
                      Color(0xFF61A4F1),
                      Color(0xFF73AEF5),
                      Color(0xFF80AEF5),
//                    Colors.white,

                    ],
                    stops: [ 0.1, 0.46, 0.52, 0.75/*, 1*/],
                  ),
              ),
            ),
            Container(
              height: double.infinity,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 40,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildBuscador(),
                    SizedBox(height: 30,),
                    _buildSliderPromo(),
                    SizedBox(height: 50,),
                    _buildCategorias(),
                  ],
                ),
              ),
            )
          ],
        ),
    );
  }
  Widget _buildBuscador() {
    return Container(
      alignment: Alignment.center,
      decoration: kBoxDecorationStyle,
      height: 60.0,
      child: TextField(
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'OpenSans',
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14.0),
          prefixIcon: Icon(
            LineAwesomeIcons.search,
            color: Colors.white,
          ),
          hintText: 'Que desea pedir',
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }
  Widget _buildSliderPromo() {
    return Container(
      height: 200,
      child: Swiper(
      itemBuilder: (BuildContext context, int index){
          return Image.asset(images[index], fit: BoxFit.fill,);
        },
        itemCount: 3,
        viewportFraction: 0.8,
        scale: 0.85,
        pagination: SwiperPagination(),
        control: null,
        autoplay: true,
        duration: 500,
        autoplayDelay: 5000,
        autoplayDisableOnInteraction: true,
      ),
    );
  }
  Widget _buildCategorias() {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
//              _buildCategoriasBtn(() => Navigator.pushNamed(context, ExtractArgumentsScreen.routeName,),
//                  Icon(LineAwesomeIcons.carrot, color: Colors.white, size: 40,), "Verduleria", Colors.greenAccent),
              _buildCategoriasBtn((){
                Navigator.push(context, MaterialPageRoute(builder: (context) => CategoriasPage()));
                Controller.categoria = "Verduleria";
              },
                Icon(LineAwesomeIcons.carrot, color: Colors.white, size: 40,), "Verduleria", Colors.greenAccent),
              _buildCategoriasBtn((){
                Navigator.push(context, MaterialPageRoute(builder: (context) => CategoriasPage()));
                Controller.categoria = "Carniceria";
              },
                Icon(LineAwesomeIcons.wine_bottle, color: Colors.white, size: 40,), "Carniceria", Colors.redAccent),
              _buildCategoriasBtn(() {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CategoriasPage()));
                Controller.categoria = "Panaderia";
              },
                Icon(LineAwesomeIcons.cloud_with__a_chance_of__meatball, color: Colors.white,size: 40,), "Panaderia", Colors.purpleAccent),
              _buildCategoriasBtn(() {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CategoriasPage()));
                Controller.categoria = "Farmacia";
              },
                Icon(LineAwesomeIcons.apple, color: Colors.white,size: 40,), "Farmacia", Colors.orangeAccent),
            ],
          ),
          SizedBox(height: 60,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildCategoriasBtn(() {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CategoriasPage()));
                Controller.categoria = "Ferreteria";
              },
                Icon(LineAwesomeIcons.restroom, color: Colors.white, size: 40,), "Ferreteria", Colors.blueAccent),
              _buildCategoriasBtn(() {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CategoriasPage()));
                Controller.categoria = "Basar";
              },
                Icon(LineAwesomeIcons.drumstick_with_bite_taken_out, color: Colors.white, size: 40,), "Basar", Colors.amberAccent[200]),
              _buildCategoriasBtn(() {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CategoriasPage()));
                Controller.categoria = "Resto";
              },
                Icon(LineAwesomeIcons.warehouse, color: Colors.white, size: 40,), "Resto", Colors.lightBlueAccent),
              _buildCategoriasBtn(() {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CategoriasPage()));
                Controller.categoria = "Farmacia";
              },
                Icon(LineAwesomeIcons.warehouse, color: Colors.white, size: 40,), "Farmacia", Colors.deepPurpleAccent),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildCategoriasBtn(Function onTap, Icon logo, categoria, bckColor){
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: <Widget>[
          Container(
            height: 60,
            width: 60,
            child: logo,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: bckColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 2),
                  blurRadius: 6,
                ),
              ],
//              image: DecorationImage(image: logo,),
            ),
          ),
          SizedBox(height: 15,),
          Text("$categoria"),
        ],
      ),
    );
  }
//  Future<bool> _onBackPressed(BuildContext context) {
//    return showDialog(
//      context: context,
//      builder: (context) => new AlertDialog(
//        title: new Text('Desea salir?'),
//        actions: <Widget>[
//          FlatButton(
//            onPressed: () => print ("uwu")/*Navigator.of(context).pop(false)*/,
//            child: Text("NO"),
//          ),
//          FlatButton(
//            onPressed: () => print ("hola")/*Navigator.of(context).pop(true)*/,
//            child: Text("SI"),
//          ),
//        ],
//        elevation: 15.0,
//        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
//      ),
//    ) ??
//        false;
//  }
}

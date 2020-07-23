import 'package:delivery_prueba1/src/utils/constants.dart';
import 'package:delivery_prueba1/src/utils/lista_promos_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';


class HomePage extends StatelessWidget {
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
              _buildCategoriasBtn(() => print("Verdu"), Icon(LineAwesomeIcons.carrot, color: Colors.white, size: 40,), "Verdu", Colors.greenAccent),
              _buildCategoriasBtn(() => print("Verdu"), Icon(LineAwesomeIcons.wine_bottle, color: Colors.white, size: 40,), "Verdu", Colors.redAccent),
              _buildCategoriasBtn(() => print("Verdu"), Icon(LineAwesomeIcons.cloud_with__a_chance_of__meatball, color: Colors.white,size: 40,), "Verdu", Colors.purpleAccent),
              _buildCategoriasBtn(() => print("Verdu"), Icon(LineAwesomeIcons.apple, color: Colors.white,size: 40,), "Verdu", Colors.orangeAccent),
            ],
          ),
          SizedBox(height: 60,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildCategoriasBtn(() => print("Verdu"), Icon(LineAwesomeIcons.restroom, color: Colors.white, size: 40,), "Verdu", Colors.blueAccent),
              _buildCategoriasBtn(() => print("Verdu"), Icon(LineAwesomeIcons.drumstick_with_bite_taken_out, color: Colors.white, size: 40,), "Verdu", Colors.amberAccent[200]),
              _buildCategoriasBtn(() => print("Verdu"), Icon(LineAwesomeIcons.warehouse, color: Colors.white, size: 40,), "Verdu", Colors.lightBlueAccent),
              _buildCategoriasBtn(() => print("Verdu"), Icon(LineAwesomeIcons.warehouse, color: Colors.white, size: 40,), "Verdu", Colors.deepPurpleAccent),
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
  Widget _buildIconBtn(Function onTap, Icon icn){
    return Ink(
      height: 80,
      decoration: const ShapeDecoration(shape: CircleBorder(),color: Colors.blue),
      child: IconButton(icon: icn, onPressed: onTap, color: Colors.white,),
    );
  }
}

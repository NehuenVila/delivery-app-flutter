import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:delivery_prueba1/src/entities/usuario.dart';
import 'package:delivery_prueba1/src/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:delivery_prueba1/src/entities/usuario.dart';

class ProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue,
      padding: EdgeInsets.symmetric(
        horizontal: 40.0,
        vertical: 90.0,
      ),
      child: Column(
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _cardProfile(),
          SizedBox(height: 20.0,),
          _cardOptions(),
        ],
      ),
    );
  }

  Widget _cardProfile() {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10.0,
            ),
          ),
          _buildImage(
                () => print('Login with Facebook'),
            AssetImage('assets/perfiles/user.png'),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ListTile(
                title: Center(child: Text('Usuario')),
                subtitle: Center(child: Text('Nehuen')),
              ),
//              Divider(),
              ListTile(
                title: Center(child: Text('Correo')),
                subtitle: Center(child: Text('JuanPerkin@delVila')),
              ),
              SizedBox(height: 10.0,)
            ],
          ),
        ],
      ),
    );
  }

  Widget _cardOptions() {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(LineAwesomeIcons.alternate_pen),
            title: Text('Cambiar foto de perfil'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider(),
          ListTile(
            leading: Icon(LineAwesomeIcons.bug),
            title: Text('Reportar problema'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider(),
          ListTile(
            leading: Icon(LineAwesomeIcons.book_reader),
            title: Text('Sobre nosotros'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider(),
          ListTile(
            leading: Icon(LineAwesomeIcons.alternate_sign_out),
            title: Text('Cerrar sesion'),
          )
        ],
      ),
    );
  }


  Widget _buildImage(Function onTap, AssetImage logo) {
    return GestureDetector(
      onTap: onTap,
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
            image: logo,
          ),
        ),
      ),
    );
  }


}







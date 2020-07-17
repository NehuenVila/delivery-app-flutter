
import 'package:delivery_prueba1/src/entities/usuario.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
 Usuario usuario = new Usuario('3', 'Nehuen', 'Nehuenvila15@gmail.com');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF478DE0),
      body: Container(
//        color: Colors.lightBlue,
//      decoration: ,
        padding: EdgeInsets.symmetric(
          horizontal: 40.0,
          vertical: 40.0,
        ),
        child: Column(
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _cardProfile(),
            SizedBox(height: 20.0,),
            _cardOptions(),
          ],
        ),
      ),
    );
  }

  String seeName()=> usuario.name.toString();

  String seeMail()=> usuario.mail.toString();

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
                subtitle: Center(child: Text(seeName())),
              ),
//              Divider(),
              ListTile(
                title: Center(child: Text('Correo')),
                subtitle: Center(child: Text(seeMail())),
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
            leading: Icon(LineAwesomeIcons.alternate_pen, color: Colors.blueAccent,),
            title: Text('Cambiar foto de perfil'),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.blueAccent,),
          ),
          Divider(),
          ListTile(
            leading: Icon(LineAwesomeIcons.bug, color: Colors.blueAccent,),
            title: Text('Reportar problema'),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.blueAccent,),
          ),
          Divider(),
          ListTile(
            leading: Icon(LineAwesomeIcons.book_reader, color: Colors.blueAccent,),
            title: Text('Sobre nosotros'),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.blueAccent,),
          ),
          Divider(),
          ListTile(
            leading: Icon(LineAwesomeIcons.alternate_sign_out, color: Colors.blueAccent,),
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







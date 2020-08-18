
import 'dart:io';

import 'package:delivery_prueba1/src/entities/usuario.dart';
import 'package:delivery_prueba1/src/utils/controller_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;


class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
 Usuario usuario = new Usuario('3', 'Nehuen', 'Nehuenvila15@gmail.com');

 static File imageFile;
 String url = 'https://jsonplaceholder.typicode.com/todos/1';
// String url = 'http://10.0.2.2/DeliveryWS/rest/rws/bienvenida';
 //192.168.0.100 ip localhost:8080

 Future<http.Response> fetchPost() {
   return http.get(url);
 }

 Future<String> api() async{
   var res = await http.get(url);
   print(res.body);
 }


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
                stops: [ 0.1, 0.46, 0.52, 0.75/*, 1*/],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 25.0,
              vertical: 40.0,
            ),
            child: Column(
              children: <Widget>[
                _cardProfile(),
                SizedBox(height: 20.0,),
                _cardOptions(),
              ],
            ),
          ),
        ],
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
          _seleccion(),
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

  Widget _seleccion(){
    if(imageFile != null){
      return _buildImage2(
            () => print('hola'),
      );
    }else{
      return _buildImage(
            () => print('Selecciona foto perfil'),
      );}
  }

  Widget _cardOptions() {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(LineAwesomeIcons.alternate_pen, color: Colors.blueAccent,),
            title: Text('Cambiar foto de perfil', ),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.blueAccent,),
            onTap: ()=> _opcionFoto(context),
          ),
          Divider(),
          ListTile(
            leading: Icon(LineAwesomeIcons.bug, color: Colors.blueAccent,),
            title: Text('Reportar problema'),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.blueAccent,),
            onTap: ()=> api(),
          ),
          Divider(),
          ListTile(
            leading: Icon(LineAwesomeIcons.book_reader, color: Colors.blueAccent,),
            title: Text('Sobre nosotros'),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.blueAccent,),
            onTap: () => _alertText(context),
          ),
          Divider(),
          ListTile(
            leading: Icon(LineAwesomeIcons.alternate_sign_out, color: Colors.blueAccent,),
            title: Text('Cerrar sesion'),
            onTap: (){
//              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
              Controller.login = false;
              Phoenix.rebirth(context);
            },
          )
        ],
      ),
    );
  }

  Widget _buildImage(Function onTap) {
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
            image:  AssetImage('assets/perfiles/user.png'),
          ),
        ),
      ),
    );
  }

 Widget _buildImage2(Function onTap) {
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
           image:  FileImage(imageFile),
         ),
       ),
     ),
   );
 }


  void _alertText(BuildContext context){
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context){
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)
            ),
            title: Text('Sobre Nosotros'),
            content: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris tempor, tortor id accumsan posuere, tortor nisl interdum metus, et egestas libero ante et nulla. Nam aliquam diam nec libero ultrices, bibendum scelerisque nulla efficitur. Curabitur porta ex vel ante commodo venenatis. Nunc tristique tincidunt urna, vel vestibulum augue placerat consequat.'
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris tempor, tortor id accumsan posuere, tortor nisl interdum metus, et egestas libero ante et nulla. Nam aliquam diam nec libero ultrices, bibendum scelerisque nulla efficitur. Curabitur porta ex vel ante commodo venenatis. Nunc tristique tincidunt urna, vel vestibulum augue placerat consequat.'
                ''),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          );
        }
    );
  }

 Future<void> _opcionFoto(BuildContext context) {
   return showDialog(
       context: context,
       builder: (BuildContext context) {
         return AlertDialog(
           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
             title: Text("De donde quiere seleccionar una imagen nueva?"),
             content: SingleChildScrollView(
               child: ListBody(
                 children: <Widget>[
                   GestureDetector(
                     child: Text("Galeria"),
                     onTap: () {
                       _openGallery(context);
                     },
                   ),
                   Padding(padding: EdgeInsets.all(8.0)),
                   GestureDetector(
                     child: Text("Camara"),
                     onTap: () {
                       _openCamera(context);
                     },
                   )
                 ],
               ),
             ));
       });
 }

 void _openGallery(BuildContext context) async {
   var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
   this.setState(() {
     imageFile = picture;
   });
   Navigator.of(context).pop();
 }

 void _openCamera(BuildContext context) async {
   var picture = await ImagePicker.pickImage(source: ImageSource.camera);
   this.setState(() {
     imageFile = picture;
   });
   Navigator.of(context).pop();
 }

}







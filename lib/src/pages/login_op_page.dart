import 'package:delivery_prueba1/src/pages/tab_navegator.dart';
import 'package:delivery_prueba1/src/utils/controller_util.dart';
import 'package:delivery_prueba1/src/utils/login_state_util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:delivery_prueba1/src/utils/constants.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;
  String _usuario = 'nehuen';
  String _clave = '1234';
  bool _claveCorrecta = false;
  bool _usuarioCorrecto = false;

  bool _claveOculta = true;
  IconData _iconPass = LineAwesomeIcons.eye_slash_1;

  final _claveTC = TextEditingController();
  final _userTC = TextEditingController();

  //para ocultar y mostrar widget
  bool _isVisible = false;

  //firebase login

  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser _user;
  bool isSignIn = false;
  GoogleSignIn _googleSignIn = new GoogleSignIn();

  Future<void> handleSignIn() async {
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount.authentication;

    AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    UserCredential result = (await _auth.signInWithCredential(credential));

    _user = result.user;
    //print(_user.displayName);

    setState(() {
      isSignIn = true;
    });
  }


  Future<void> gooleSignout() async {
    await _auth.signOut().then((onValue) {
      _googleSignIn.signOut();
      setState(() {
        isSignIn = true;
      });
    });
  }



  void clearTextInput(TextEditingController txtcon){
    txtcon.clear();
  }

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: _userTC,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Ingrese correo',
              hintStyle: kHintTextStyle,
            ),
            onChanged: (valor){
              setState(() {
                if(_usuario == valor){
                  _usuarioCorrecto = true;
                }
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Contraseña',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: _claveTC,
            obscureText: _claveOculta,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              suffixIcon: IconButton(
                onPressed: (){
                  setState(() {
                    _claveOculta = !_claveOculta;
                    if(_claveOculta){
                      _iconPass = LineAwesomeIcons.eye_slash_1;
                    }else{
                      _iconPass = LineAwesomeIcons.eye;
                    }

                  });
                },
                icon: Icon(_iconPass),
                color: Colors.white,
              ),
              hintText: "Ingrese contraseña",
              hintStyle: kHintTextStyle,
            ),
            onChanged: (valor){
              setState(() {
                if(_clave == valor){
                  _claveCorrecta = true;
                }
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.topRight,
      child: FlatButton(
        onPressed: () => print('Forgot Password Button Pressed'),
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Olvido su contraseña?',
          style: kLabelStyle,
        ),
      ),
    );
  }

  Widget _buildRememberMeCheckbox() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value;
                });
              },
            ),
          ),
          Text(
            'Recuerdame',
            style: kLabelStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          setState(() {

          });
          print('Login Button Pressed');
          clearTextInput(_claveTC);
          if(_claveCorrecta && _usuarioCorrecto){
//            Navigator.pushNamed(context, '/');
            clearTextInput(_userTC);
            _isVisible = false;
            //Provider.of<LoginState>(context).login();
            Navigator.push(context, MaterialPageRoute(builder: (context) => TabPage()));
            // Phoenix.rebirth(context);// me parece que esta mal esto
          }else{
            _isVisible = true;
            print('datos incorrectos');
          }
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'INICIAR SESION',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildSignInWithText() {
    return Column(
      children: <Widget>[
        Text(
          '- O -',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          'Inicia sesion con',
          style: kLabelStyle,
        ),
      ],
    );
  }

  Widget _buildSocialBtn(Function onTap, AssetImage logo) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.0,
        width: 60.0,
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

  Widget _buildSocialBtnRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildSocialBtn(
                () => print('Login with Facebook'),
            AssetImage(
              'assets/logos/facebook.jpg',
            ),
          ),
          _buildSocialBtn(
                () => handleSignIn().whenComplete((){
                  //Provider.of<LoginState>(context).login();
                   Navigator.push(context, MaterialPageRoute(builder: (context) => TabPage()));
                }),
            AssetImage(
              'assets/logos/google_icon.png',
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildSignupBtn() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/s');
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              //text: 'Don\'t have an Account? ',
              text: 'No tienes cuenta?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              //text: 'Sign Up',
              text: ' Crear nueva cuenta',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Desea salir?'),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text("NO"),
          ),
          FlatButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text("SI"),
          ),
        ],
        elevation: 15.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
      ),
    ) ??
        false;
  }



  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Stack(
              children: <Widget>[
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF73AEF5),
                        Color(0xFF61A4F1),
                        Color(0xFF478DE0),
                        Color(0xFF398AE5),
                      ],
                      stops: [0.1, 0.4, 0.7, 0.9],
                    ),
                  ),
                ),
                Container(
                  height: double.infinity,
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: 40.0,
                      vertical: 50.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Iniciar sesion',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 30.0),
                        _buildEmailTF(),
                        SizedBox(
                          height: 30.0,
                        ),
                        _buildPasswordTF(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Visibility(
                              visible: _isVisible,
                              child: Text(
                                'Datos incorrecto',
                                style: TextStyle(
                                    color: Colors.red
                                ),
                              ),
                            ),
//                         SizedBox(width: _auxPass),
                            _buildForgotPasswordBtn(),
                          ],
                        ),
                        _buildRememberMeCheckbox(),
                        _buildLoginBtn(),
                        _buildSignInWithText(),
                        _buildSocialBtnRow(),
                        _buildSignupBtn(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

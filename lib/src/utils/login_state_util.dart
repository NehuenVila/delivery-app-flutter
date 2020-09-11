import 'package:flutter/material.dart';

class LoginState with ChangeNotifier{
  bool loggedIn = false;

  void login(){
    loggedIn = true;
    notifyListeners();
  }

  void logout(){
    loggedIn = false;
    notifyListeners();
  }

  bool isLoggeIn() => loggedIn;

}
import 'package:flutter/material.dart';
import 'package:flutter_oficina_app/screens/intro_screen.dart';
import 'package:flutter_oficina_app/screens/login_screen.dart';

// Route Names
const String introScreen = 'intro';
const String loginScreen = 'login';

// Route Controller
Route<dynamic> controller(RouteSettings settings){
  switch (settings.name){
    case introScreen:
      return MaterialPageRoute(builder: (context)=> const IntroScreen());
    case loginScreen:
      return MaterialPageRoute(builder: (context)=> LoginScreen());
    default:
    throw('This route name does not exist');
  }
}
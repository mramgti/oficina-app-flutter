import 'package:flutter/material.dart';
import 'package:flutter_oficina_app/screens/intro_screen.dart';
import 'package:flutter_oficina_app/screens/login_screen.dart';
import 'package:flutter_oficina_app/themes/light_theme.dart';



void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroScreen(),
      theme: lightTheme,
      routes: {
        '/intro_screen': (context) => const IntroScreen(),
        '/login_screen': (context) => LoginScreen(),
        // '/apphub': (context) => 
      }
    );
  }
}

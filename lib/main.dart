import 'package:flutter/material.dart';
import 'package:flutter_oficina_app/screens/intro_screen.dart';
import 'package:flutter_oficina_app/themes/light_theme.dart';
import 'routes/routes.dart' as routes;


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
      onGenerateRoute: routes.controller,
      initialRoute: routes.introScreen,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_oficina_app/components/general_text_field.dart';
import 'package:flutter_oficina_app/components/login_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  // Text input controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          leading: BackButton(
            onPressed: () => Navigator.pushNamed(context, '/intro_screen'),
          ),
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                // logo
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary, borderRadius: BorderRadius.circular(50)),
                  child: Icon(
                    Icons.person_2,
                    size: 100,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),

                const SizedBox(
                  height: 50,
                ),
                // Text

                Text(
                  'Bem vindo à Oficina Mecânica!',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 16),
                ),

                const SizedBox(
                  height: 10,
                ),

                Text(
                  'Preencha os campos para ter acesso ao aplicativo.',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                ),

                const SizedBox(
                  height: 35,
                ),

                // Username textfield
                GeneralTextField(
                  controller: usernameController,
                  hintText: 'Usuário',
                  obscuretext: false,
                ),

                const SizedBox(
                  height: 35,
                ),

                // Password textfield
                GeneralTextField(
                  controller: passwordController,
                  hintText: 'Senha',
                  obscuretext: true,
                ),

                const SizedBox(
                  height: 100,
                ),

                // Sign in Button
                LoginButton(
                    onTap: () => Navigator.pushNamed(context, '/login_screen')),
              ],
            ),
          ),
        ));
  }
}

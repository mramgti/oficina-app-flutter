import 'package:flutter/material.dart';
import 'package:flutter_oficina_app/components/general_button.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Icon(
              Icons.car_repair_sharp,
              size: 82,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            const SizedBox(
              height: 25,
            ),
            //title
            const Text('Oficina Mecânica',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),

            const SizedBox(
              height: 10,
            ),
            //subtitle
            Text(
              'O melhor lugal para levar seu carro',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
            // button to login

            const SizedBox(
              height: 15,
            ),
            GeneralButton(
                onTap: () => Navigator.pushNamed(context, '/login_screen'),
                child: const Icon(Icons.arrow_forward))
          ],
        ),
      ),
    );
  }
}

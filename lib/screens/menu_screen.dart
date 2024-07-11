import 'package:flutter/material.dart';
import 'package:flutter_oficina_app/components/menu_box.dart';
import 'package:flutter_oficina_app/routes/routes.dart' as routes;

class MenuScreen extends StatelessWidget {
  MenuScreen({super.key});
  final List options = [
    [
      'AGENDAMENTO',
      const Icon(
        Icons.calendar_month,
        size: 55,
      )
    ],
    ['REVISÃO', const Icon(Icons.build, size: 55)],
    ['ESTOQUE', const Icon(Icons.inventory, size: 55)],
    ['CLIENTES', const Icon(Icons.person_add_alt_1, size: 55)],
    ['FUNCIONÁRIOS', const Icon(Icons.people_alt, size: 55)],
    ['ADMIN', const Icon(Icons.key, size: 55)],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          leading: BackButton(
            onPressed: () => Navigator.pushNamed(context, routes.loginScreen),
          ),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Bem Vindo,'),
                        Text(
                          'João Pedro',
                          style: TextStyle(fontSize: 35),
                        )
                      ],
                    ),
                    Icon(
                      Icons.miscellaneous_services,
                      size: 120,
                    )
                  ],
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              // Items Grid
              Expanded(
                  child: GridView.builder(
                      itemCount: options.length,
                      padding: const EdgeInsets.all(25),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3, childAspectRatio: 1 / 1.1),
                      itemBuilder: (context, index) {
                        return MenuBox(
                            name: options[index][0], icon: options[index][1]);
                      }))
            ],
          ),
        ));
  }
}

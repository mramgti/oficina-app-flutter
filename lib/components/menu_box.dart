import 'package:flutter/material.dart';

class MenuBox extends StatelessWidget {
  final String name;
  final Icon icon;
  const MenuBox({super.key, required this.name, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(25)),
        child: Column(
          children: [
            // Icon
            const SizedBox(
              height: 20,
            ),
            icon,
            const SizedBox(
              height: 20,
            ),
            // Name
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}

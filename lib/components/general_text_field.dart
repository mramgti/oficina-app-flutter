import 'package:flutter/material.dart';

class GeneralTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscuretext;
  const GeneralTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscuretext});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        controller: controller,
        obscureText: obscuretext,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.inversePrimary)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400)),
            fillColor: Colors.grey.shade400,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
                fontSize: 14)),
      ),
    );
  }
}

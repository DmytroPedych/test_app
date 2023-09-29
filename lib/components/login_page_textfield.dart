// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class LoginPageTextField extends StatelessWidget {
  final controller;
  final String hintText; //надпись на текстовом поле
  final bool obscuretext;
  const LoginPageTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscuretext});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme_ = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      child: TextField(
        textAlign: TextAlign.left,
        controller: controller, // to access input information from textfield
        obscureText: obscuretext, //bool, для скрьітия текста в пароле
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade500),
          ),
          fillColor: Theme.of(context).colorScheme.primary,
          filled: true,
          hintText: hintText,
          hintStyle: textTheme_.headline5,
        ),
      ),
    );
  }
}

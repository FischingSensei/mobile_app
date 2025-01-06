import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {

  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: "Email or Username"
          ),
        ),
        TextField(
          decoration: InputDecoration(
            labelText: "Password",
          ),
          obscureText: true,
        )
      ],
    );
  }
}
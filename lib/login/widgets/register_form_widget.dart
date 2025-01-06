import 'package:flutter/material.dart';

class RegisterForm extends StatelessWidget {

  const RegisterForm({super.key});


  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                    labelText: "Lastname"
                ),
              ),
            ),
            SizedBox(
              width: 42,
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                    labelText: "Firstname"
                ),
              ),
            )
          ],
        ),
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
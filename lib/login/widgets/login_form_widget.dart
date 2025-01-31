import 'package:fishing_sensei/widgets/controlled_text_fields_widget.dart';
import 'package:fishing_sensei/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {

  late ControlledTextField email;
  late ControlledTextField password;

  LoginForm({ super.key }) {
      email = ControlledTextField(labelText: 'Email or username');
      password = ControlledTextField(labelText: 'Password', obscureText: true,);
  }

  String getEmail() {
    return email.text();
  }

  String getPassword() {
    return password.text();
  }

  @override
  Widget build(BuildContext context) {
    return TextForm(
      children: [
        FractionallySizedBox(
          alignment: Alignment.centerLeft,
          widthFactor: 0.85,
          child: Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: email,
          ),
        ),
        FractionallySizedBox(
          alignment: Alignment.centerLeft,
          widthFactor: 0.85,
          child: Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: password,
          ),
        ),
      ]
    );
  }
}
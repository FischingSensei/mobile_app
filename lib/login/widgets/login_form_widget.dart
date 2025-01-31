import 'package:fishing_sensei/widgets/controlled_text_fields_widget.dart';
import 'package:fishing_sensei/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {

  late ControlledTextField email;
  late ControlledTextField password;
  late String formName;

  LoginForm({ super.key, name }) {
      email = ControlledTextField(labelText: 'Email or username');
      password = ControlledTextField(labelText: 'Password', obscureText: true,);
      formName = name;
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
        Align(
          alignment: Alignment.center,
          child: Text(
            formName,
            style: TextStyle(
              fontSize: 15
            ),
          ),
        ),
        const SizedBox(height: 16,),
        FractionallySizedBox(
          alignment: Alignment.centerLeft,
          widthFactor: 0.85,
          child: email,
        ),
        FractionallySizedBox(
          alignment: Alignment.centerLeft,
          widthFactor: 0.85,
          child: password,
        ),
      ]
    );
  }
}
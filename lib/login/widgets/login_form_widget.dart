import 'package:fishing_sensei/login/widgets/auth_form.dart';
import 'package:fishing_sensei/widgets/controlled_text_fields_widget.dart';
import 'package:fishing_sensei/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';

class LoginForm extends AAuthForm {

  late ControlledTextField email;
  late ControlledTextField password;
  late String formName;

  LoginForm({ super.key, name }) {
      email = ControlledTextField(labelText: 'Email');
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
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late double _opacity = 0.0;

  void changeFormOpacity(double opacity) {
    setState(() {
      _opacity = opacity;
    });
  }

  @override
  void initState() {
    super.initState();

    // Delay the animation slightly to ensure smooth transition
    Future.delayed(Duration(milliseconds: 1), () {
      setState(() {
        _opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return
      AnimatedOpacity(
        opacity: _opacity,
        duration: Duration(seconds: 1),
        child: TextForm(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                widget.formName,
                style: TextStyle(
                  fontSize: 15
                ),
              ),
            ),
            const SizedBox(height: 16,),
            FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: 0.85,
              child: widget.email,
            ),
            FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: 0.85,
              child: widget.password,
            ),
          ]
      )
    );
  }
}
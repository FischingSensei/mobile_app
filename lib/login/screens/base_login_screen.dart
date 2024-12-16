import 'package:fishing_sensei/login/widgets/login_button_widget.dart';
import 'package:fishing_sensei/widgets/gradient_background.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {

  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  void _login() {
    setState(() {
      debugPrint("Login button");
    });
  }

  void _register() {
    setState(() {
      debugPrint("Register");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: Align(
          alignment: const Alignment(0, .2),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoginButton(
                onPressed: _login,
                child: const Text("Login")
              ),
              const SizedBox(
                height: 24,
              ),
              LoginButton(
                onPressed: _register,
                child: const Text("Register")
              )
            ],
          ),
        ),
      )
    );
  }
}
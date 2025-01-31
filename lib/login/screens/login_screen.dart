import 'dart:math';

import 'package:fishing_sensei/login/screens/register_screen.dart';
import 'package:flutter/material.dart';

import '../../home/screens/home_screen.dart';
import '../../theme.dart';
import '../../widgets/gradient_background.dart';
import '../service/auth_service.dart';
import '../widgets/auth_button_widget.dart';
import '../widgets/login_form_widget.dart';

class LoginScreen extends StatelessWidget {

  late LoginForm loginForm;

  LoginScreen({super.key});


  Future<bool> _sendAuthData(BuildContext context) async {
    bool success = await AuthService.login(loginForm);

    if (success) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()));
      return true;
    }
    return false;
  }


  List<Widget> _displayButton(BuildContext context) {
    return [
      Column(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(
                minWidth: 100,
                maxWidth: 200
            ),
            child: AuthButton(
              onPressed: () => _sendAuthData(context),
              child: const Text("Login")
            )
          ),
          Row(
            children: [
              Text("Don't have an account? Register "),
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  alignment: Alignment.centerLeft
                ),
                onPressed: () => {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen())
                  )
                },
                child: Text(
                  "here !",
                  style: TextStyle(
                    color: AppTheme.green,
                    decoration: TextDecoration.underline,
                    decorationColor: AppTheme.green
                  ),
                )
              ),
            ],
          )
        ],
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //const BackgroundAnimation() [TODO] Sin wave animation
            loginForm = LoginForm(name: 'Login',),
            const SizedBox(
              height: 42,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _displayButton(context)
            )
          ]
        ),
      )
    );
  }
}

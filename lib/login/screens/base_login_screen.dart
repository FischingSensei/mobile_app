import 'package:fishing_sensei/login/widgets/background_animation_wave_widget.dart';
import 'package:fishing_sensei/login/widgets/login_button_widget.dart';
import 'package:fishing_sensei/login/widgets/login_form_widget.dart';
import 'package:fishing_sensei/login/widgets/register_form_widget.dart';
import 'package:fishing_sensei/widgets/gradient_background.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {

  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool _showLoginForm = false;
  bool _showRegisterForm = false;

  void _login() {
    setState(() {
      _showLoginForm = true;
      _showRegisterForm = false;
      debugPrint("Login button");
    });
  }

  void _register() {
    setState(() {
      _showLoginForm = false;
      _showRegisterForm = true;
      debugPrint("Register");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //const BackgroundAnimation() [TODO] Sinwave animation,
              if (_showLoginForm) const LoginForm(),
              if (_showRegisterForm) const RegisterForm(),
              if (!_showLoginForm) ...[
                LoginButton(
                  onPressed: _login,
                  child: const Text("Login")
                ),
              ],
              const SizedBox(
                height: 24,
              ),
              if (!_showRegisterForm) ...[
                LoginButton(
                  onPressed: _register,
                  child: const Text("Register")
                )
              ],
            ]
          ),
      )
    );
  }
}
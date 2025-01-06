import 'package:fishing_sensei/login/service/login_service.dart';
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
  bool _sendButton = false;

  void _login() {
    setState(() {
      _showLoginForm = true;
      _showRegisterForm = false;
      _sendButton = true;
      debugPrint("Login button");
    });
  }

  void _register() {
    setState(() {
      _showLoginForm = false;
      _showRegisterForm = true;
      _sendButton = true;
      debugPrint("Register");
    });
  }

  void _sendData() async {
    if (!_showLoginForm) {
      await LoginService.fetchUsers();
    }
    setState(() {});
  }

  List<Widget> _displayLoginButton() {
    return [
      ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: 100,
          maxWidth: 100
        ),
        child: LoginButton(
          onPressed: _login,
          child: const Text("Login")
        ),
      ),
      const SizedBox(
        width: 24,
      ),
      if (_sendButton) ...[
        ConstrainedBox(
          constraints: const BoxConstraints(
              minWidth: 100,
              maxWidth: 100
          ),
          child: LoginButton(
              onPressed: _sendData,
              child: const Text("Send")
          )
        )
      ]
    ];
  }

  List<Widget> _displayRegisterButton() {
    return [
      ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: 100,
          maxWidth: 200
        ),
        child: LoginButton(
          onPressed: _register,
          child: const Text("Register")
        )
      ),
      const SizedBox(
        width: 24,
      ),
      if (_sendButton) ...[
        ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: 100,
            maxWidth: 200
          ),
          child: LoginButton(
            onPressed: _sendData,
            child: const Text("Send")
          )
        )
      ]
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //const BackgroundAnimation() [TODO] Sinwave animation
              if (_showLoginForm) const LoginForm(),
              if (_showRegisterForm) const RegisterForm(),
              if (!_showLoginForm) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _displayLoginButton(),
                )
              ],
              const SizedBox(
                height: 24,
              ),
              if (!_showRegisterForm) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _displayRegisterButton()
                )
              ],
            ]
          ),
      )
    );
  }
}
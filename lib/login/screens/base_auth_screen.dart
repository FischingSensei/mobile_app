import 'package:fishing_sensei/login/service/auth_service.dart';
import 'package:fishing_sensei/login/widgets/background_animation_wave_widget.dart';
import 'package:fishing_sensei/login/widgets/login_button_widget.dart';
import 'package:fishing_sensei/login/widgets/login_form_widget.dart';
import 'package:fishing_sensei/login/widgets/register_form_widget.dart';
import 'package:fishing_sensei/widgets/gradient_background.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {

  const AuthScreen({super.key});

  @override
  State<StatefulWidget> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  bool _showLoginForm = false;
  bool _showRegisterForm = false;
  bool _sendButton = false;

  late LoginForm loginForm;
  late RegisterForm registerForm;

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

  void _sendAuthData() async {

    if (_showLoginForm) {
      return await AuthService.login(loginForm);
    }
    return await AuthService.register(registerForm);
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
              onPressed: _sendAuthData,
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
            onPressed: _sendAuthData,
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
            //const BackgroundAnimation() [TODO] Sin wave animation
            if (_showLoginForm) loginForm = LoginForm(),
            if (_showRegisterForm) registerForm = RegisterForm(),
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
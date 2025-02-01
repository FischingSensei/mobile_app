import 'dart:math';

import 'package:fishing_sensei/login/screens/register_screen.dart';
import 'package:fishing_sensei/login/service/dto/auth_response.dart';
import 'package:flutter/material.dart';

import '../../home/screens/home_screen.dart';
import '../../theme.dart';
import '../../widgets/gradient_background.dart';
import '../service/auth_service.dart';
import '../widgets/auth_button_widget.dart';
import '../widgets/login_form_widget.dart';

class LoginScreen extends StatefulWidget {


  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginForm loginForm;

  bool _isRequesting = false;
  AuthResponse _response = AuthResponse(false, "");

  Future<bool> _sendAuthData(BuildContext context) async {

    setState(() {
      _isRequesting = true;
    });

    _response = await AuthService.login(loginForm);

    if (_response.success) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()));
      return true;
    }

    setState(() {
      _isRequesting = false;
    });
    return false;
  }

  Widget _handleRequest(BuildContext context) {
    return (!_isRequesting) ? AuthButton(
        onPressed: () => _sendAuthData(context),
        child: const Text("Login")
    ) : CircularProgressIndicator(
      color: AppTheme.green,
    );
  }

  Widget _displayErrorText() {
    return (_response.msg.isEmpty && _response.success) ? SizedBox.shrink() :
        Text(
          _response.msg,
          style: TextStyle(
            color: AppTheme.softYellow
          ),
        );
  }

  List<Widget> _displayButton(BuildContext context) {
    return [
      Column(
        children: [
          _displayErrorText(),
          ConstrainedBox(
            constraints: const BoxConstraints(
                minWidth: 10,
                maxWidth: 200
            ),
            child: _handleRequest(context)
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

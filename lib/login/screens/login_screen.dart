import 'package:fishing_sensei/login/screens/abstract_form_screen.dart';
import 'package:fishing_sensei/login/screens/register_screen.dart';
import 'package:flutter/material.dart';

import '../../theme.dart';
import '../../widgets/gradient_background.dart';
import '../widgets/login_form_widget.dart';

class LoginScreen extends AFormScreen {
  const LoginScreen({super.key, required super.formType});

  @override
  State<AFormScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends AFormScreenState {
  late LoginForm loginForm;

  List<Widget> _displayButton(BuildContext context) {
    return [
      Column(
        children: [
          ...super.baseFormScreenWidgetList(loginForm),
          Row(
            children: [
              Text("Don't have an account? "),
              TextButton(
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      alignment: Alignment.centerLeft),
                  onPressed: () => {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterScreen(
                                      formType: 'Register',
                                    )))
                      },
                  child: Text(
                    "Register here !",
                    style: TextStyle(
                        color: AppTheme.green,
                        decoration: TextDecoration.underline,
                        decorationColor: AppTheme.green),
                  )),
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
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        //const BackgroundAnimation() [TODO] Sin wave animation
        loginForm = LoginForm(
          name: 'Login',
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _displayButton(context))
      ]),
    ));
  }
}

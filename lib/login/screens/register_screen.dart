import 'package:fishing_sensei/login/screens/abstract_form_screen.dart';
import 'package:fishing_sensei/login/screens/login_screen.dart';
import 'package:fishing_sensei/login/widgets/register_form_widget.dart';
import 'package:flutter/material.dart';

import '../../theme.dart';
import '../../widgets/gradient_background.dart';

class RegisterScreen extends AFormScreen {
  const RegisterScreen({super.key, required super.formType});

  @override
  State<AFormScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends AFormScreenState {
  late RegisterForm registerForm;

  List<Widget> _displayButton(BuildContext context) {
    return [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Append element
          ...super.baseFormScreenWidgetList(registerForm),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("You already have an account ? "),
              TextButton(
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      alignment: Alignment.centerLeft),
                  onPressed: () => {
                        context,
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen(
                                      formType: 'Login',
                                    )))
                      },
                  child: Text(
                    "Login here !",
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
        registerForm = RegisterForm(
          name: 'Register',
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _displayButton(context))
      ]),
    ));
  }
}

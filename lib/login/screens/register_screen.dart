import 'package:fishing_sensei/home/screens/home_screen.dart';
import 'package:fishing_sensei/login/screens/login_screen.dart';
import 'package:fishing_sensei/login/widgets/register_form_widget.dart';
import 'package:flutter/material.dart';

import '../../theme.dart';
import '../../widgets/gradient_background.dart';
import '../service/auth_service.dart';
import '../widgets/auth_button_widget.dart';

class RegisterScreen extends StatelessWidget {

  late RegisterForm registerForm;

  RegisterScreen({super.key});

  Future<bool> _sendAuthData(BuildContext context) async {
    bool success = await AuthService.register(registerForm);

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
              child: const Text("Register")
            )
          ),
          Row(
            children: [
              Text("You already have an account ? "),
              TextButton(
                style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    alignment: Alignment.centerLeft
                ),
                onPressed: () => {
                  context,
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen())
                  )
                },
                child: Text(
                  "Login here !",
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
              registerForm = RegisterForm(name: 'Register',),
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

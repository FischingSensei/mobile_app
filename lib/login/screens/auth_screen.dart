import 'package:fishing_sensei/login/screens/login_screen.dart';
import 'package:fishing_sensei/login/screens/register_screen.dart';
import 'package:fishing_sensei/login/widgets/auth_button_widget.dart';
import 'package:fishing_sensei/login/widgets/login_form_widget.dart';
import 'package:fishing_sensei/login/widgets/register_form_widget.dart';
import 'package:fishing_sensei/widgets/gradient_background.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {

  const AuthScreen({ super.key });

  @override
  State<StatefulWidget> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  late LoginForm loginForm;
  late RegisterForm registerForm;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //const BackgroundAnimation() [TODO] Sin wave animation
            ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: 100,
                maxWidth: 200
              ),
              child: AuthButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen())
                  );
                },
                child: Text('Login')
              ),
            ),
            SizedBox(height: 16,),
            ConstrainedBox(
              constraints: BoxConstraints(
              minWidth: 100,
              maxWidth: 200
              ),
              child: AuthButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen())
                  );
                },
                child: Text('Register')
              ),
            ),
          ]
        ),
      )
    );
  }
}
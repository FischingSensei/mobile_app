import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {

  Function()? onPressed;
  final Widget? child;

  LoginButton( { super.key, required this.onPressed, required this.child } );

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: child
    );
  }
}

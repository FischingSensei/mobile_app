import 'package:flutter/material.dart';

class NavBarButton extends StatelessWidget {
  VoidCallback onPressed;
  Icon icon;

  NavBarButton({required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        style: IconButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        icon: icon);
  }
}

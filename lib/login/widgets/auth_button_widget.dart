import 'package:flutter/material.dart';

class AuthButton extends StatefulWidget {

  Function()? onPressed;
  final Widget? child;

  AuthButton( { super.key, required this.onPressed, required this.child } );

  @override
  State<AuthButton> createState() => _AuthButtonState();
}

class _AuthButtonState extends State<AuthButton>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1),
    );

    // Define the scaling animation
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        _controller.forward();
      },
      onTapUp: (_) {
        _controller.reverse(); // Revert animation when the button is released
        if (widget.onPressed != null) {
          widget.onPressed!(); // Trigger the onPressed callback
        }
      },
      onTapCancel: () {
        _controller.reverse();
      },
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: ElevatedButton(
          style: ButtonStyle(
            alignment: Alignment.center,
          ),
          onPressed: widget.onPressed,
          child: widget.child
        )
      )
    );
  }
}

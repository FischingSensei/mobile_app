import 'dart:math';

import 'package:flutter/material.dart';

class BackgroundAnimation extends StatefulWidget {

  const BackgroundAnimation({super.key});

  @override
  State<StatefulWidget> createState() => _BackgroundAnimationState();

}

class _BackgroundAnimationState extends State<BackgroundAnimation>
    with SingleTickerProviderStateMixin{

  late Animation<double> _waveAnimation;
  late AnimationController _controller;

   @override
   void initState() {

     super.initState();
     _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
     );

     _waveAnimation = Tween<double>(begin: 0, end: 1).animate(
       CurvedAnimation(parent: _controller, curve: Curves.linear)
     );

     _controller.forward();
     _controller.repeat();

   }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
    animation: _waveAnimation,
    builder: (context, child) {
      return CustomPaint(
          painter: SinPainter(_waveAnimation),
          child: Container()
      );
    },
        );
  }
}

class SinPainter extends CustomPainter {

  final Animation<double> _sinValue;

  const SinPainter(this._sinValue);

  @override
  void paint(Canvas canvas, Size size) {

    Paint paint = Paint()
    ..color = Colors.yellow;

    canvas.drawCircle(const Offset(400, 300), 200 * _sinValue.value, paint);
  }


  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
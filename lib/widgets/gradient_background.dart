import 'package:fishing_sensei/theme.dart';
import 'package:flutter/cupertino.dart';

class GradientBackground extends StatelessWidget {

  final Widget child;

  const GradientBackground({ super.key, required this.child });

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: backgroundGradient,
        ),
        child: child
    );
  }
}
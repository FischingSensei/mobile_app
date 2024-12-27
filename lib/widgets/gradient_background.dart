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
          gradient: LinearGradient(
            colors: [
              // start color
              Color.fromARGB(255, 16, 91, 122),
              // end color
              Color.fromARGB(255, 75, 159, 162)
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
        child: child
    );
  }
}
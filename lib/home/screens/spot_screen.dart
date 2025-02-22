import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SpotScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Slider(min: 1, max: 50, value: 42, onChanged: (val) {
        print(val);
      }),
    );
  }
}
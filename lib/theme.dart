import 'package:flutter/material.dart';

const TextTheme appTextTheme = TextTheme(
  bodyMedium: TextStyle(
    color: Colors.white,
  ),
  bodySmall: TextStyle(
    color: Colors.black
  ),
);

const ElevatedButtonThemeData loginButtonTheme = ElevatedButtonThemeData(
  style: ButtonStyle(
    backgroundColor: WidgetStatePropertyAll(Colors.grey),
  )
);
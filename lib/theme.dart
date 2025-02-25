import 'package:flutter/material.dart';

class AppTheme {
  static final Color green = Color.fromARGB(255, 157, 226, 126);
  static final Color softYellow = Color.fromARGB(255, 249, 248, 113);
}

const TextTheme appTextTheme = TextTheme(
  bodyMedium: TextStyle(
    color: Colors.white,
  ),
  bodySmall: TextStyle(color: Colors.black),
);

const ElevatedButtonThemeData loginButtonTheme = ElevatedButtonThemeData(
    style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.white)));

InputDecorationTheme formTheme = InputDecorationTheme(
    focusColor: Colors.white,
    filled: false,
    hintStyle: TextStyle(color: Colors.white, fontSize: 1),
    labelStyle: TextStyle(color: Colors.white),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey, width: 1),
      borderRadius: BorderRadius.circular(5),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(20),
    ));

const LinearGradient backgroundGradient = LinearGradient(
  colors: [
    // start color
    Color.fromARGB(255, 16, 91, 122),
    // end color
    Color.fromARGB(255, 75, 159, 162)
  ],
  begin: Alignment.bottomLeft,
  end: Alignment.topRight,
);

const BoxDecoration navbarDecoration = BoxDecoration(
  gradient: backgroundGradient,
  borderRadius: const BorderRadius.only(
    topLeft: Radius.circular(20),
    topRight: Radius.circular(20),
    bottomLeft: Radius.circular(20),
    bottomRight: Radius.circular(20),
  ),
);

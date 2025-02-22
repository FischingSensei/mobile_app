import 'package:fishing_sensei/home/screens/spot_screen.dart';
import 'package:fishing_sensei/widgets/NavBar/bottom_navbar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late int selectedScreen = 0;

  final List<Widget> Screen = [
    SpotScreen(),
    SpotScreen(),
    SpotScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(
        onClick: (n) {
          setState(() {
            selectedScreen = n;
          });
        },
      ),
      body: Container(
        child: Text("Hello world", style: TextStyle(color: Colors.red),),
      ),
    );
  }
}
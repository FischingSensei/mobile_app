import 'package:fishing_sensei/widgets/NavBar/bottom_navbar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Home Screen", style: TextStyle(color: Colors.red),),
      bottomNavigationBar: BottomNavBar()
    );
  }

}
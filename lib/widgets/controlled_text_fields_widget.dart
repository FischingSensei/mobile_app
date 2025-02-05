import 'package:flutter/material.dart';

class ControlledTextField extends StatefulWidget {
  final String labelText;
  final bool obscureText;

  final TextEditingController _controller = TextEditingController();

  ControlledTextField({
    super.key,
    required this.labelText,
    this.obscureText = false,
  });

  @override
  State<ControlledTextField> createState() => _ControlledTextFieldState();

  String text() {
    return _controller.text;
  }

}

class _ControlledTextFieldState extends State<ControlledTextField> {

  @override
  void initState() {
    super.initState();
  }


  @override
  void dispose() {
    widget._controller.dispose(); // Proper cleanup of controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        cursorColor: Colors.grey,
        style: TextStyle(
          color: Colors.white
        ),
        controller: widget._controller,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          labelText: widget.labelText, // Corrected label handling
          border: OutlineInputBorder(), // Optional: adds a visible border
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextForm extends StatefulWidget {
  final List<Widget> children;

  const TextForm({ super.key, required this.children });

  @override
  State<StatefulWidget> createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.children,
    );
  }
}
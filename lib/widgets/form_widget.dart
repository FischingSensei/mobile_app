import 'package:flutter/cupertino.dart';

class TextForm extends StatefulWidget {
  final List<Widget> children;

  const TextForm({ super.key, required this.children });

  @override
  State<StatefulWidget> createState() => _FormState();
}

class _FormState extends State<TextForm> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.children,
    );
  }
}
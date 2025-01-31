import 'package:fishing_sensei/widgets/controlled_text_fields_widget.dart';
import 'package:fishing_sensei/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {

  late ControlledTextField firstname;
  late ControlledTextField lastname;
  late ControlledTextField email;
  late ControlledTextField password;
  late String formName;

  RegisterForm({ super.key, name }) {
    firstname = ControlledTextField(labelText: 'Firstname');
    lastname = ControlledTextField(labelText: 'Lastname');
    email = ControlledTextField(labelText: 'Email');
    password = ControlledTextField(labelText: 'Password', obscureText: true,);
    formName = name;
  }

  String getFirstname() {
    return firstname.text();
  }

  String getLastname() {
    return lastname.text();
  }

  String getEmail() {
    return email.text();
  }

  String getPassword() {
    return password.text();
  }

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  double _opacity = 0.0;

  Widget _nameWidget(Widget name) {
    return Flexible(
      child: FractionallySizedBox(
        widthFactor: 0.6, // Each field takes 40% of the available width
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: 120,  // Minimum width for smaller screens
            maxWidth: 200,  // Maximum width for larger screens
          ),
          child: name,
        ),
      )
    );
  }

  @override
  void initState() {
    super.initState();

    // Delay the animation slightly to ensure smooth transition
    Future.delayed(Duration(milliseconds: 1), () {
      setState(() {
        _opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _opacity,
      duration: Duration(seconds: 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.formName,
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(height: 16), // Space between title and fields
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // Lastname Flexible
              _nameWidget(widget.lastname),

              SizedBox(width: 16), // Space between fields

              // Firstname Flexible
              _nameWidget(widget.firstname)
            ],
          ),
          FractionallySizedBox(
            widthFactor: 0.85, // Email takes 85% of the available width
            child: widget.email,
          ),
          FractionallySizedBox(
            widthFactor: 0.85,
            child: widget.password,
          ),
        ],
      )
    );
  }
}
import 'package:fishing_sensei/widgets/controlled_text_fields_widget.dart';
import 'package:fishing_sensei/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatelessWidget {

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

  Widget _NameWidget(Widget name) {
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
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          formName,
          style: TextStyle(fontSize: 15),
        ),
        SizedBox(height: 16), // Space between title and fields
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // Lastname Flexible
            _NameWidget(lastname),

            SizedBox(width: 16), // Space between fields

            // Firstname Flexible
            _NameWidget(firstname)
          ],
        ),
        FractionallySizedBox(
          widthFactor: 0.85, // Email takes 85% of the available width
          child: email,
        ),
        FractionallySizedBox(
          widthFactor: 0.85,
          child: password,
        ),
      ],
    );
  }
}
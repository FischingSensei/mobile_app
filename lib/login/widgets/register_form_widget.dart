import 'package:fishing_sensei/widgets/controlled_text_fields_widget.dart';
import 'package:fishing_sensei/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';

//class RegisterForm extends StatelessWidget {
//
//  const RegisterForm({super.key});
//
//
//  @override
//  Widget build(BuildContext context) {
//    return const Column(
//      children: [
//        Row(
//          children: [
//            Expanded(
//              child: TextField(
//                decoration: InputDecoration(
//                    labelText: "Lastname"
//                ),
//              ),
//            ),
//            SizedBox(
//              width: 42,
//            ),
//            Expanded(
//              child: TextField(
//                decoration: InputDecoration(
//                    labelText: "Firstname"
//                ),
//              ),
//            )
//          ],
//        ),
//        TextField(
//          decoration: InputDecoration(
//              labelText: "Email or Username"
//          ),
//        ),
//        TextField(
//          decoration: InputDecoration(
//            labelText: "Password",
//          ),
//          obscureText: true,
//        )
//      ],
//    );
//  }
//}

class RegisterForm extends StatelessWidget {

  late ControlledTextField firstname;
  late ControlledTextField lastname;
  late ControlledTextField email;
  late ControlledTextField password;

  RegisterForm({super.key}) {
    firstname = ControlledTextField(labelText: 'Firstname');
    lastname = ControlledTextField(labelText: 'Lastname');
    email = ControlledTextField(labelText: 'Email');
    password = ControlledTextField(labelText: 'Password', obscureText: true,);
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
  Widget build(BuildContext context) {
    return TextForm(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 155
                ),
                child: lastname,
              )
            ),
            SizedBox(
              width: 42,
            ),
            Flexible(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 155
                ),
                child: firstname,
              )
            ),
          ]
        ),
        FractionallySizedBox(
          alignment: Alignment.centerLeft,
          widthFactor: 0.85,
          child: Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: email,
          ),
        ),
        FractionallySizedBox(
          alignment: Alignment.centerLeft,
          widthFactor: 0.85,
          child: Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: password,
          ),
        ),
      ],
    );
  }
}
import 'package:fishing_sensei/login/widgets/auth_form.dart';
import 'package:fishing_sensei/login/widgets/login_form_widget.dart';
import 'package:fishing_sensei/login/widgets/register_form_widget.dart';
import 'package:flutter/material.dart';

import '../../home/screens/home_screen.dart';
import '../../theme.dart';
import '../service/auth_service.dart';
import '../service/dto/auth_response.dart';
import '../widgets/auth_button_widget.dart';

abstract class AFormScreen extends StatefulWidget {

  final String formType;

  const AFormScreen({ required this.formType, super.key });

  @override
  State<StatefulWidget> createState();
}

abstract class AFormScreenState extends State<AFormScreen> {

  bool isRequesting = false;
  AuthResponse response = AuthResponse(false, "");

  Future<bool> requestApi(BuildContext context, AAuthForm form) async {
    setState(() {
      response = AuthResponse(false, "");
      isRequesting = true;
    });

    if (widget.formType == "Login") {
      response = await AuthService.login(form as LoginForm);
    } else {
      response = await AuthService.register(form as RegisterForm);
    }

    if (response.success) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()));
      return true;
    }

    setState(() {
      isRequesting = false;
    });

    return false;
  }

  Widget displayErrorText() {
    return (response.msg.isEmpty && response.success) ? SizedBox.shrink() :
      Text(
        response.msg,
        style: TextStyle(
            color: AppTheme.softYellow
        ),
      );
  }

  Widget handleRequest(BuildContext context, AAuthForm form) {
    return (!isRequesting) ? AuthButton(
        onPressed: () => requestApi(context, form),
        child: Text(
          widget.formType,
          style: TextStyle(
            color: Colors.black
          ),
        )
    ) : CircularProgressIndicator(
      color: AppTheme.green,
    );
  }

  List<Widget> baseFormScreenWidgetList(AAuthForm form) {
    return [
      displayErrorText(),
      ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: 10,
          maxWidth: 200
        ),
        child: handleRequest(context, form)
      )
    ];
  }

  // Just override request class
  @override
  Widget build(BuildContext context);
}
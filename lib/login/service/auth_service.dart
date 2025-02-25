import 'dart:convert';

import 'package:fishing_sensei/login/service/dto/auth_response.dart';
import 'package:fishing_sensei/login/widgets/login_form_widget.dart';
import 'package:fishing_sensei/login/widgets/register_form_widget.dart';
import 'package:fishing_sensei/url_builder.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static Future<void> fetchUsers() async {
    print(dotenv.env["API"]);
    final res = await http.get(Uri.parse("http://10.0.2.2:8080/"));

    print(res.body);
  }

  static Future<AuthResponse> login(LoginForm form) async {
    Uri uri = UrlBuilder().addPath("auth").uri();
    final String email = form.getEmail();
    final String password = form.getPassword();

    if (email.isEmpty || password.isEmpty) {
      return AuthResponse(false, "Email or password is empty !");
    }

    Map<String, String> data = {
      "type": "Login",
      "email": email,
      "password": password
    };

    final res = await http
        .post(
          uri,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(data),
        )
        .timeout(const Duration(seconds: 30),
            onTimeout: () => http.Response(
                '{'
                '"code": -1, "msg": "Connection timeout"'
                '}',
                408));

    final resData = jsonDecode(res.body);
    return AuthResponse(resData["code"] > 0, resData["msg"]);
  }

  static Future<AuthResponse> register(RegisterForm form) async {
    final Uri uri = UrlBuilder().addPath("auth").uri();
    final String email = form.getEmail();
    final String password = form.getPassword();
    final String firstname = form.getFirstname();
    final String lastname = form.getLastname();

    if (email.isEmpty ||
        password.isEmpty ||
        firstname.isEmpty ||
        lastname.isEmpty) {
      return AuthResponse(false, "All field must be filled !");
    }

    Map<String, String> bodyData = {
      "type": "Register",
      "firstname": firstname,
      "lastname": lastname,
      "email": email,
      "password": password
    };

    final res = await http
        .post(
          uri,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(bodyData),
        )
        .timeout(const Duration(seconds: 20),
            onTimeout: () => http.Response(
                '{'
                '"code": -1, "msg": "Connection timeout"'
                '}',
                408));

    final resData = jsonDecode(res.body);
    return AuthResponse(resData["code"] > 0, resData["msg"]);
  }
}

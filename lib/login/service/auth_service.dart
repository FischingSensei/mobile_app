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

    Map<String, String> data = {
      "type": "Login",
      "email": form.getEmail(),
      "password": form.getPassword()
    };

    final res = await http.post(
      uri,
      headers: {
        "Content-Type": "application/json"
      },
      body: jsonEncode(data),
    );

    final resData = jsonDecode(res.body);
    return AuthResponse(resData["code"] > 0, resData["msg"]);
  }

  static Future<bool> register(RegisterForm form) async {

    Uri uri = UrlBuilder().addPath("auth").uri();

    Map<String, String> bodyData = {
      "type": "Register",

      "firstname": form.getFirstname(),
      "lastname": form.getLastname(),
      "email": form.getEmail(),
      "password": form.getPassword()
    };

    final res = await http.post(
      uri,
      headers: {
        "Content-Type": "application/json"
      },
      body: jsonEncode(bodyData),
    );

    final resData = jsonDecode(res.body);
    return resData["code"] > 0;
  }
}
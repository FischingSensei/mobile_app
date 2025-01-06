import 'package:http/http.dart' as http;

class LoginService {

  static Future<void> fetchUsers() async {
    final res = await http.get(Uri.parse("http://10.0.2.2:8080/"));

    print(res.body);
  }

}
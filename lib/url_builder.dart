import 'package:flutter_dotenv/flutter_dotenv.dart';

class UrlBuilder {
  static final String baseURL = dotenv.get("API");

  String _finalUrl = baseURL;

  UrlBuilder addPath(String path) {
    _finalUrl += "/$path";
    return this;
  }

  String url() {
    return _finalUrl;
  }

  Uri uri() {
    return Uri.parse(_finalUrl);
  }

  void clear() {
    _finalUrl = baseURL;
  }
}
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../constants/constants.dart';

class ApiHandler {
  static final client = http.Client();
  static const storage = FlutterSecureStorage();

  static Future<dynamic> post(var body, String endpoint,
      Map<String, dynamic>? params, String? token) async {
    try {
      var res = await client.post(buildUrl(endpoint, params),
          body: body,
          headers: {
            "Content-type": "application/json",
            "Authorization": "Bearer $token"
          });
      switch (res.statusCode) {
        case 200:
        case 401:
        case 400:
        case 500:
          return res.body;
        default:
          throw Exception('wrong call api');
      }
    } catch (e) {
      //ignore
    }
  }

  static Future<dynamic> get(
      String endpoint, Map<String, dynamic>? params, String? token) async {
    try {
      var res = await client.get(buildUrl(endpoint, params), headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $token"
      });
      switch (res.statusCode) {
        case 200:
        case 401:
        case 404:
        case 500:
          return res.body;
        default:
          throw Exception('API error');
      }
    } catch (e) {
      //ignore
    }
  }

  static Uri buildUrl(String endpoint, Map<String, dynamic>? params) {
    if (params != null) {
      final apiPath = '$apiUrl$endpoint?';
      final updatedMap = Map<String, dynamic>.from(
          params..removeWhere((key, value) => value == ""));
      return Uri.parse(apiPath).replace(queryParameters: updatedMap);
    }
    final apiPath = apiUrl + endpoint;
    return Uri.parse(apiPath);
  }

  static Future<void> storeToken(String token) async {
    await storage.write(key: "token", value: token);
  }

  static Future<String?> getToken() async {
    return await storage.read(key: "token");
  }

  static Future<void> deleteToken() async {
    return await storage.delete(key: "token");
  }
}

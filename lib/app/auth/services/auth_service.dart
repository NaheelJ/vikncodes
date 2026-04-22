import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/constants/api_endpoints.dart';

class AuthService {
  Future<Map<String, dynamic>> login(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse(ApiEndpoints.login),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': username,
          'password': password,
          'is_mobile': true,
        }),
      );

      final data = jsonDecode(response.body);
      
      // The API returns success code 6000 in the 'success' field
      final int successCode = data['success'] ?? 0;

      if (successCode == 6000) {
        // Success - Extract data from the response structure
        final userData = data['data'];
        final accessToken = userData?['access'];
        final refreshToken = userData?['refresh'];
        final userID = (data['user_id'] ?? userData?['user_id']).toString();
        final username = data['username'] ?? userData?['username'];

        final prefs = await SharedPreferences.getInstance();
        if (accessToken != null) {
          await prefs.setString('token', accessToken.toString());
        }
        if (refreshToken != null) {
          await prefs.setString('refresh_token', refreshToken.toString());
        }
        if (userID != 'null') {
          await prefs.setString('userID', userID);
        }
        if (username != null) {
          await prefs.setString('username', username.toString());
        }

        return {
          'success': true, 
          'message': data['message'] ?? 'Login successfully',
          'data': data
        };
      } else {
        // Failure
        return {
          'success': false, 
          'message': data['message'] ?? data['error'] ?? 'Login failed'
        };
      }
    } catch (e) {
      return {'success': false, 'message': 'Connection error: Please check your internet.'};
    }
  }

  Future<bool> isAuthenticated() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    return token != null;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
}

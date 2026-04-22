import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_profile_model.dart';

class ProfileService {
  Future<UserProfile?> fetchUserProfile() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final userID = prefs.getString('userID') ?? '62';
      
      final url = 'https://www.api.viknbooks.com/api/v10/users/user-view/$userID/';

      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['StatusCode'] == 6000) {
          return UserProfile.fromJson(data);
        }
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}

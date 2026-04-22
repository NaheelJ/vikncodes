import 'package:flutter/material.dart';
import '../models/user_profile_model.dart';
import '../services/profile_service.dart';

class ProfileProvider extends ChangeNotifier {
  final ProfileService _profileService = ProfileService();
  
  UserProfile? _userProfile;
  UserProfile? get userProfile => _userProfile;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _hasError = false;
  bool get hasError => _hasError;

  Future<void> loadUserProfile() async {
    _isLoading = true;
    _hasError = false;
    notifyListeners();

    try {
      final result = await _profileService.fetchUserProfile();
      if (result != null) {
        _userProfile = result;
        _hasError = false;
      } else {
        _hasError = true;
      }
    } catch (e) {
      _hasError = true;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

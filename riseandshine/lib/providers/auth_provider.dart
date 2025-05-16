import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  bool _isAuthenticated = false;
  String? _phoneNumber;

  bool get isAuthenticated => _isAuthenticated;
  String? get phoneNumber => _phoneNumber;

  Future<bool> login(String phoneNumber, String password) async {
    // Validate phone number (10 digits) and password (123123)
    if (phoneNumber.length == 10 && password == '123123') {
      _isAuthenticated = true;
      _phoneNumber = phoneNumber;
      
      // Save to shared preferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isAuthenticated', true);
      await prefs.setString('phoneNumber', phoneNumber);
      
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<void> logout() async {
    _isAuthenticated = false;
    _phoneNumber = null;
    
    // Clear shared preferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    
    notifyListeners();
  }

  Future<void> checkAuthStatus() async {
    final prefs = await SharedPreferences.getInstance();
    _isAuthenticated = prefs.getBool('isAuthenticated') ?? false;
    _phoneNumber = prefs.getString('phoneNumber');
    notifyListeners();
  }
} 
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../Services/SecureStorge.dart';

class LoginState with ChangeNotifier {

  final FlutterSecureStorage storage = FlutterSecureStorage();
  String _username = '';
  String _password = '';
  String _usernameLogin = '';
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  String get username => _username;
  String get usernameLogin => _usernameLogin;
  String get password => _password;

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void setUsernameLogin(String username) {
    _usernameLogin = username;
    print("UsernameLogin set to: $_usernameLogin");
    notifyListeners();
  }

  void setUsername(String username) {
    _username = username;
    print("Username set to: $_username");
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  // Check internet connection
  Future<bool> hasInternetConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  Future<bool> login(String username, String password) async {
    Map<String, dynamic> map = {
      "username": username,
      "password": password,
    };
    print("Attempting login with username, password: $map");
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('usernameLogin', username.toLowerCase());
        await saveCredentials(username, password);
        return true;
  }

  // Method for offline login using saved credentials
  Future<bool> loginOfflineMode(String username, String password) async {
    try {
      // Retrieve stored credentials from secure storage
      String? storedUsername = await storage.read(key: 'username');
      String? storedPassword = await storage.read(key: 'password');

      // Validate the provided credentials against the stored ones
      if (storedUsername != null && storedPassword != null) {
        if (storedUsername == username && storedPassword == password) {
          print("Offline login successful with stored credentials");
          return true;
        } else {
          print("Offline login failed: Invalid credentials");
          return false;
        }
      } else {
        print("No stored credentials found for offline login");
        return false;
      }
    } catch (e) {
      print("Error during offline login: $e");
      return false;
    }
  }

}
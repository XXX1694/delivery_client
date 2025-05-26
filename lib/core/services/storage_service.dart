import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static final StorageService _instance = StorageService._internal();
  factory StorageService() => _instance;
  StorageService._internal();

  late final SharedPreferences _prefs;
  static const String _tokenKey = 'auth_token';
  static const String _phoneKey = 'phone_number';

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Token management
  Future<void> saveToken(String token) async {
    await _prefs.setString(_tokenKey, token);
  }

  String? getToken() {
    return _prefs.getString(_tokenKey);
  }

  Future<void> clearToken() async {
    await _prefs.remove(_tokenKey);
  }

  // Phone number management
  Future<void> savePhoneNumber(String phoneNumber) async {
    await _prefs.setString(_phoneKey, phoneNumber);
  }

  String? getPhoneNumber() {
    return _prefs.getString(_phoneKey);
  }

  Future<void> clearPhoneNumber() async {
    await _prefs.remove(_phoneKey);
  }

  // Clear all data
  Future<void> clearAll() async {
    await _prefs.clear();
  }
}

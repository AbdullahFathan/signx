import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  static const String _userKey = 'user_data';

  // 1. Simpan data (String)
  static Future<void> saveUser(String userJson) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userKey, userJson);
  }

  // 2. Baca data
  static Future<String?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userKey);
  }

  // 3. Hapus data
  static Future<void> removeUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
  }
}

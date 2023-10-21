import 'package:shared_preferences/shared_preferences.dart';

class FirstConnection {

  FirstConnection._();

  static const String _keyLastAccessTimeKey = "keyLastAccessTimeKey";

  static Future<void> runIfFirst(Function func) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String lastAccessTime = prefs.getString(_keyLastAccessTimeKey) ?? '';
    String today = DateTime.now().toString().split(' ')[0];
    if (today != lastAccessTime) {
      func();
      prefs.setString(_keyLastAccessTimeKey, today);
    }
  }
}
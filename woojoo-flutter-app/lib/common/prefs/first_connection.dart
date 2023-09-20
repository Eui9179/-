import 'package:shared_preferences/shared_preferences.dart';

class FirstConnection {

  FirstConnection._();

  static const String _lastAccessTimeKey = "lastAccessTime";

  static Future<bool> isFirst() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String lastAccessTime = prefs.getString(_lastAccessTimeKey) ?? '';
    String today = DateTime.now().toString().split(' ')[0];

    if (today == lastAccessTime) return false;

    prefs.setString('lastAccessTime', today);
    return true;
  }
}
import 'package:shared_preferences/shared_preferences.dart';

enum SetType { string, bool, int, double }

class SharedServices {
  Future setData(SetType type, String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    type == SetType.string
        ? prefs.setString(key, value)
        : type == SetType.int
            ? prefs.setInt(key, value)
            : type == SetType.double
                ? prefs.setDouble(key, value)
                : type == SetType.bool
                    ? prefs.setBool(key, value)
                    : null;
    print('Data Store $key');
  }

  Future getData(SetType type, String key) async {
    final prefs = await SharedPreferences.getInstance();
    dynamic data = type == SetType.string
        ? prefs.getString(key)
        : type == SetType.int
            ? prefs.getInt(key)
            : type == SetType.double
                ? prefs.getDouble(key)
                : type == SetType.bool
                    ? prefs.getBool(key)
                    : null;
    print('key $key  data $data');
    return data;
  }
}

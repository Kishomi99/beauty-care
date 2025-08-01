import 'package:shared_preferences/shared_preferences.dart';

class PrefUtils {
  static SharedPreferences? _prefs;

  Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
    //  print('SharedPreference Initialized');
  }

  static Future<void> clearPreferences() async {
    await _prefs?.clear();
  }

  static Future<void> logout() async {
    await _prefs?.remove('token');
    await _prefs?.setBool('logged', false);
    print('User logged out: ${_prefs?.getString('token')}');
  }

  static Future<void> setLogged(bool value) async {
    await _prefs!.setBool('logged', value);
  }

  static Future<void> setToken(String value) async {
    await _prefs!.setString('token', value);
  }

  static Future<void> setWishlistIds(List<String> ids) async {
    await _prefs!.setStringList('wishlist', ids);
  }

  static Future<void> removeWishId(String id) async {
    await _prefs?.remove('wishlist');
  }

  static Future<void> setUserId(int value) async {
    await _prefs!.setString('id', value.toString());
  }

  String getToken() {
    return _prefs!.getString('token') ?? '';
  }

  int getUserId() {
    return int.parse(_prefs!.getString('id') ?? '0');
  }

  static List<String> getWishlistIds() {
    return _prefs!.getStringList('wishlist_ids') ?? [];
  }

  bool isLogged() {
    return _prefs!.getBool('logged') ?? false;
  }
}

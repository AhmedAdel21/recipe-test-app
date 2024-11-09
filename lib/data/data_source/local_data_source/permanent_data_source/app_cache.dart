import 'package:shared_preferences/shared_preferences.dart';

class AppCacheKeys {
  static const isUserLoggedIn = "isUserLoggedIn";
  static const userId = "userId";
  static const email = "email";
  static const password = "password";
}

abstract class AppSharedPrefs {
  Future<void> setIsUserLoggedIn(bool value);
  bool getIsUserLoggedIn();

  Future<void> setUserId(int userId);
  int getUserId();

  Future<void> setEmail(String email);
  String getEmail();

  Future<void> setPassword(String password);
  String getPassword();
}

class AppSharedPrefsImpl implements AppSharedPrefs {
  final SharedPreferences _sharedPreferences;
  AppSharedPrefsImpl(this._sharedPreferences);

  @override
  Future<void> setIsUserLoggedIn(bool value) async =>
      await _sharedPreferences.setBool(AppCacheKeys.isUserLoggedIn, value);

  @override
  Future<void> setPassword(String password) async =>
      await _sharedPreferences.setString(AppCacheKeys.password, password);

  @override
  Future<void> setEmail(String email) async =>
      await _sharedPreferences.setString(AppCacheKeys.email, email);

  @override
  Future<void> setUserId(int userId) async =>
      await _sharedPreferences.setInt(AppCacheKeys.userId, userId);

  @override
  bool getIsUserLoggedIn() =>
      _sharedPreferences.getBool(AppCacheKeys.isUserLoggedIn) ?? false;

  @override
  String getPassword() =>
      _sharedPreferences.getString(AppCacheKeys.password) ?? "";

  @override
  String getEmail() => _sharedPreferences.getString(AppCacheKeys.email) ?? "";

  @override
  int getUserId() => _sharedPreferences.getInt(AppCacheKeys.userId) ?? -1;
}

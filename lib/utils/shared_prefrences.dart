import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferences {
  static late SharedPreferences _sharedPreferences;

  static const String keyIsLogIn = "key_isLogIn";
  static const String keyAccessToken = "key_access_token";
  static const String keyEmail = "key_email";
  static const String keyName = "key_name";
  static const String keyUserId = "key_user_id";
  static const String keyIsPassedIntro = "key_is_passed_intro";
  static const String keyLanguage = "key_language";
  static const String keyDeviceToken = "key_device_token";
  static const String keyImage = "key_image";
  static const String keyPhone = "key_phone";

  static Future init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static void clearProfile() {
    accessToken = "";
    isLogIn = false;
    email = "";
    name = "";
    userId = 0;
    deviceToken = "";
    phone = "";
    image = "";
  }

  static String get accessToken =>
      _sharedPreferences.getString(keyAccessToken) ?? "";

  static set accessToken(String value) =>
      _sharedPreferences.setString(keyAccessToken, value);

  static bool get isLogIn => _sharedPreferences.getBool(keyIsLogIn) ?? false;

  static set isLogIn(bool value) =>
      _sharedPreferences.setBool(keyIsLogIn, value);

  static bool get isPassedIntro =>
      _sharedPreferences.getBool(keyIsPassedIntro) ?? false;

  static set isPassedIntro(bool value) =>
      _sharedPreferences.setBool(keyIsPassedIntro, value);

  static String get language => _sharedPreferences.getString(keyLanguage) ?? "";

  static set language(String value) =>
      _sharedPreferences.setString(keyLanguage, value);

  static String get email => _sharedPreferences.getString(keyEmail) ?? "";

  static set email(String value) =>
      _sharedPreferences.setString(keyEmail, value);

  static String get name => _sharedPreferences.getString(keyName) ?? "";

  static set name(String value) => _sharedPreferences.setString(keyName, value);

  static int get userId => _sharedPreferences.getInt(keyUserId) ?? 0;

  static set userId(int value) => _sharedPreferences.setInt(keyUserId, value);

  static String get deviceToken =>
      _sharedPreferences.getString(keyDeviceToken) ?? "";

  static set deviceToken(String value) =>
      _sharedPreferences.setString(keyDeviceToken, value);

  static String get image => _sharedPreferences.getString(keyImage) ?? "";

  static set image(String value) =>
      _sharedPreferences.setString(keyImage, value);

  static String get phone => _sharedPreferences.getString(keyPhone) ?? "";

  static set phone(String value) =>
      _sharedPreferences.setString(keyPhone, value);
}

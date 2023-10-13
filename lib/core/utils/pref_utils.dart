import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopsie/main.dart';

class PrefUtils {

static SharedPreferences _sharedPreferences = prefs;

 static void clearPreferencesData() async {
    _sharedPreferences.clear();
  }

 static Future<void> setCustomerId(String value) {
    return _sharedPreferences.setString('customer_id', value);
  }

static  String getCustomerId() {
    try {
      return _sharedPreferences.getString('customer_id') ?? '';
    } catch (e) {
      return '';
    }
  }

static Future<void> setEmail(String value) {
    return _sharedPreferences.setString('email', value);
  }

static  String getEmail() {
    try {
      return _sharedPreferences.getString('email') ?? '';
    } catch (e) {
      return '';
    }
  }

static Future<void> setFirstName(String value) {
    return _sharedPreferences.setString('first_name', value);
  }

static String getFirstName() {
    try {
      return _sharedPreferences.getString('first_name') ?? '';
    } catch (e) {
      return '';
    }
  }

static Future<void> setLastName(String value) {
    return _sharedPreferences.setString('last_name', value);
  }

static  String getLastName() {
    try {
      return _sharedPreferences.getString('last_name') ?? '';
    } catch (e) {
      return '';
    }
  }

static Future<void> setCartId(String value) {
    return _sharedPreferences.setString('cart_id', value);
  }

static String getCartId() {
    try {
      return _sharedPreferences.getString('cart_id') ?? '';
    } catch (e) {
      return '';
    }
  }
}

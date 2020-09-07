import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  SharedPreferences _preferences;

  getInstance() async {
    _preferences = await SharedPreferences.getInstance();
  }

  setValue({@required String value, @required String key}) async {
    await _preferences.setString(key, value);
  }

  getValue(String key) {
    return _preferences.containsKey(key) ? _preferences.get(key) : null;
  }
}

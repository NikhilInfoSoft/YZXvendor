import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedData {
  late SharedPreferences _pref;

  init() async {
    try {
      _pref = await SharedPreferences.getInstance();
    } catch (e) {
      print(e);
    }
  }

  checkLogged() async {
    try {
      await init();
      bool? data = _pref.getBool('isLogged');

      if (data != null) {
        return data;
      }
      return false;
    } catch (e) {
      print(e);
    }
  }

  setLogged(bool data) async {
    try {
      await init();
      await _pref.setBool('isLogged', data);
      return true;
    } catch (e) {
      print(e);
    }
  }

  setUser(String id, String token) async {
    try {
      await init();
      await _pref.setString('user', jsonEncode({'id': id, 'token': token}));
      return true;
    } catch (e) {
      print(e);
    }
  }

  Future<Map> getUser() async {
    await init();
    var data = await _pref.getString('user');
    if (data != null) {
      return jsonDecode(data);
    }

    return {};
  }

  Future<bool> logout() async {
    await init();
    _pref.clear();
    return true;
  }
}

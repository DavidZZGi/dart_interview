import 'package:shared_preferences/shared_preferences.dart';

class UtilPreferences {
  static final UtilPreferences _instance = UtilPreferences._internal();

  factory UtilPreferences() {
    return _instance;
  }

  UtilPreferences._internal();

  SharedPreferences? _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  get getUserName => _prefs!.getString('userName');
  set setUserName(String userName) {
    _prefs!.setString('userName', userName);
  }

  get getPassword => _prefs!.getString('password');
  set setPassword(String password) {
    _prefs!.setString('password', password);
  }

  get getUserEmail => _prefs!.getString('userEmail');
  set setUserEmail(String userEmail) {
    _prefs!.setString('userEmail', userEmail);
  }
}

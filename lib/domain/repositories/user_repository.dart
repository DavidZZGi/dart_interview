import 'package:dart_interview/app/utils/util_preferences.dart';
import 'package:dart_interview/data/entities/user.dart';
import 'package:dart_interview/data/services/user_service.dart';

//User funtionalities are defined here in UserRepository
class UserRepository implements UserService {
  late final UtilPreferences prefs;
  UserRepository({required this.prefs});
  @override
  User getCurrentUser() {
    final username = prefs.getUserName ?? '';
    final email = prefs.getUserEmail ?? '';
    final password = prefs.getPassword ?? '';

    return User(username: username, email: email, password: password);
  }

  @override
  void setCurrentUser(User user) async {
    prefs.setPassword = user.password;
    prefs.setUserEmail = user.email;
    prefs.setUserName = user.username!;
  }

  @override
  void clearCurrentUser() async {
    prefs.setPassword = '';
    prefs.setUserEmail = '';
    prefs.setUserName = '';
  }

  @override
  bool signIn(String email, String password) {
    if (prefs.getPassword == password && prefs.getUserEmail == email) {
      return true;
    }
    return false;
  }

  @override
  void signUp(String email, String password) {
    prefs.setPassword = password;
    prefs.setUserEmail = email;
  }

  @override
  bool checkUserAccount() {
    if (prefs.getPassword != null && prefs.getUserEmail != null) {
      return true;
    }
    return false;
  }
}

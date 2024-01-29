import 'package:flutter/material.dart';

import '../../../data/entities/user.dart';

class UserProvider extends ChangeNotifier {
  User? _currentUser;

  User? get currentUser => _currentUser;

  void setCurrentUser(User newUser) {
    _currentUser = newUser;
    notifyListeners();
  }

  void signOut() {
    _currentUser = User(email: '', password: '', username: '');
    notifyListeners();
  }
}

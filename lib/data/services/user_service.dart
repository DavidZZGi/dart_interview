import 'package:dart_interview/data/entities/user.dart';

//Interface for declaring User funtionalities
abstract class UserService {
  User getCurrentUser();
  void setCurrentUser(User user);
  void clearCurrentUser();
  bool signIn(String email, String password);
  void signUp(String email, String password);
  bool checkUserAccount();
}

import 'package:dart_interview/app/utils/util_preferences.dart';
import 'package:dart_interview/data/entities/user.dart';
import 'package:dart_interview/domain/repositories/user_repository.dart';
import 'package:dart_interview/presentation/state_managament/global_state_provider/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockUtilPreferences extends Mock implements UtilPreferences {}

void main() {
  late UserProvider userProvider;
  late User user;
  late UserRepository userRepository;
  late UtilPreferences sharedPreferences;

  setUp(() async {
    WidgetsFlutterBinding.ensureInitialized();
    sharedPreferences = MockUtilPreferences();
    await sharedPreferences.initPrefs();
    userProvider = UserProvider();
    user = User(
        email: 'example_user@gmail.com',
        password: 'password',
        username: 'example_user');
    userRepository = UserRepository(prefs: sharedPreferences);
  });
  group('UserProvider', () {
    test('Login successfully updates user status', () {
      userProvider.setCurrentUser(
        user,
      );
      expect(userProvider.currentUser, isNotNull);
      expect(userProvider.currentUser!.username, 'example_user');
    });

    test('Signing out successfully removes user state', () {
      userProvider.setCurrentUser(
        user,
      );
      userProvider.signOut();

      expect(userProvider.currentUser!.email, '');
    });
  });

  //this test is failing  because of a preferences
  //initialization issue, apperently is bieng made
  //in await sharedPreferences.initPrefs();
  //but it's not working properly
  group('UserRepository', () {
    test('Save and get user data', () {
      userRepository.setCurrentUser(user);
      final currentUser = userRepository.getCurrentUser();
      expect(currentUser.username, 'example_user');
    });
  });
}

import 'package:dart_interview/app/utils/util_preferences.dart';
import 'package:dart_interview/data/entities/user.dart';
import 'package:dart_interview/domain/repositories/user_repository.dart';
import 'package:dart_interview/presentation/state_managament/global_state_provider/user_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockUtilPreferences extends Mock implements UtilPreferences {}

void main() {
  late UserProvider userProvider;
  late User user;
  late MockUtilPreferences mockUtilPreferences;
  late UserRepository userRepository;
  setUp(() {
    userProvider = UserProvider();
    user = User(
        email: 'example_user@gmail.com',
        password: 'password',
        username: 'example_user');
    mockUtilPreferences = MockUtilPreferences();
    mockUtilPreferences.initPrefs();
    userRepository = UserRepository(prefs: mockUtilPreferences);
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
}
